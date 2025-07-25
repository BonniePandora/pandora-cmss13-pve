import { KEY } from 'common/keys';
import { BooleanLike } from 'common/react';
import { Component, createRef, RefObject } from 'react';
import { dragStartHandler } from 'tgui/drag';

import { Channel, ChannelIterator } from './ChannelIterator';
import { ChatHistory } from './ChatHistory';
import {
  LANGUAGE_PREFIXES,
  LineLength,
  RADIO_PREFIXES,
  WindowSize,
} from './constants';
import { getPrefix, windowClose, windowOpen, windowSet } from './helpers';
import { byondMessages } from './timers';

type ByondOpen = {
  channel: Channel;
  mapfocus: BooleanLike;
};

type ByondProps = {
  maxLength: number;
  lightMode: BooleanLike;
  scale: BooleanLike;
  extraChannels: Array<Channel>;
  languages: Array<string>;
};

type State = {
  buttonContent: string | number;
  size: WindowSize;
};

export class TguiSay extends Component<{}, State> {
  private channelIterator: ChannelIterator;
  private chatHistory: ChatHistory;
  private currentPrefix:
    | keyof typeof RADIO_PREFIXES
    | keyof typeof LANGUAGE_PREFIXES
    | null;
  private innerRef: RefObject<HTMLTextAreaElement>;
  private lightMode: boolean;
  private scale: boolean;
  private extraChannels: Array<Channel>;
  private maxLength: number;
  private languages: Array<string>;
  private messages: typeof byondMessages;
  state: State;

  constructor(props: never) {
    super(props);

    this.channelIterator = new ChannelIterator();
    this.chatHistory = new ChatHistory();
    this.currentPrefix = null;
    this.innerRef = createRef();
    this.lightMode = false;
    this.maxLength = 1024;
    this.messages = byondMessages;
    this.languages = [];
    this.state = {
      buttonContent: '',
      size: WindowSize.Small,
    };

    this.handleArrowKeys = this.handleArrowKeys.bind(this);
    this.handleBackspaceDelete = this.handleBackspaceDelete.bind(this);
    this.handleClose = this.handleClose.bind(this);
    this.handleEnter = this.handleEnter.bind(this);
    this.handleForceSay = this.handleForceSay.bind(this);
    this.handleIncrementChannel = this.handleIncrementChannel.bind(this);
    this.handleInput = this.handleInput.bind(this);
    this.handleKeyDown = this.handleKeyDown.bind(this);
    this.handleOpen = this.handleOpen.bind(this);
    this.handleProps = this.handleProps.bind(this);
    this.reset = this.reset.bind(this);
    this.setSize = this.setSize.bind(this);
    this.setValue = this.setValue.bind(this);
  }

  componentDidMount() {
    windowSet(WindowSize.Small, this.scale);

    Byond.subscribeTo('props', this.handleProps);
    Byond.subscribeTo('force', this.handleForceSay);
    Byond.subscribeTo('open', this.handleOpen);
  }

  handleArrowKeys(direction: KEY.Up | KEY.Down) {
    const currentValue = this.innerRef.current?.value;

    if (direction === KEY.Up) {
      if (this.chatHistory.isAtLatest() && currentValue) {
        // Save current message to temp history if at the most recent message
        this.chatHistory.saveTemp(currentValue);
      }
      // Try to get the previous message, fall back to the current value if none
      const prevMessage = this.chatHistory.getOlderMessage();

      if (prevMessage) {
        this.setState({ buttonContent: this.chatHistory.getIndex() });
        this.setSize(prevMessage.length);
        this.setValue(prevMessage);
      }
    } else {
      const nextMessage =
        this.chatHistory.getNewerMessage() || this.chatHistory.getTemp() || '';

      const buttonContent = this.chatHistory.isAtLatest()
        ? this.channelIterator.current()
        : this.chatHistory.getIndex();

      this.setState({ buttonContent });
      this.setSize(nextMessage.length);
      this.setValue(nextMessage);
    }
  }

  handleBackspaceDelete() {
    const typed = this.innerRef.current?.value;

    // User is on a chat history message
    if (!this.chatHistory.isAtLatest()) {
      this.chatHistory.reset();
      this.setState({
        buttonContent: this.currentPrefix ?? this.channelIterator.current(),
      });
      // Empty input, resets the channel
    } else if (
      !!this.currentPrefix &&
      this.channelIterator.isSay() &&
      typed?.length === 0
    ) {
      this.currentPrefix = null;
      this.setState({ buttonContent: this.channelIterator.current() });
    }

    this.setSize(typed?.length);
  }

  handleClose() {
    const current = this.innerRef.current;

    if (current) {
      current.blur();
    }

    this.reset();
    this.chatHistory.reset();
    this.channelIterator.reset();
    this.currentPrefix = null;
    windowClose(this.scale);
  }

  handleEnter() {
    const prefix = this.currentPrefix ?? '';
    const value = this.innerRef.current?.value;

    if (value?.length && value.length < this.maxLength) {
      this.chatHistory.add(value);
      Byond.sendMessage('entry', {
        channel: this.channelIterator.current(),
        entry: this.channelIterator.isSay() ? prefix + value : value,
      });
    }

    this.handleClose();
  }

  handleForceSay() {
    const currentValue = this.innerRef.current?.value;
    // Only force say if we're on a visible channel and have typed something
    if (!currentValue || !this.channelIterator.isVisible()) return;

    const prefix = this.currentPrefix ?? '';
    const grunt = this.channelIterator.isSay()
      ? prefix + currentValue
      : currentValue;

    this.messages.forceSayMsg(grunt, this.channelIterator.current());
    this.reset();
  }

  handleIncrementChannel() {
    this.currentPrefix = null;

    const prevThinking = this.channelIterator.isVisible();
    this.channelIterator.next(this.extraChannels);
    const nowThinking = this.channelIterator.isVisible();

    // If we've changed to/from a quiet channel, tell byond to hide/show thinking indicators
    if (prevThinking !== nowThinking) {
      this.messages.channelIncrementMsg(nowThinking);
    }

    this.setState({ buttonContent: this.channelIterator.current() });
  }

  handleInput() {
    const typed = this.innerRef.current?.value;

    // If we're typing, send the message
    if (this.channelIterator.isVisible()) {
      this.messages.typingMsg();
    }

    this.setSize(typed?.length);

    // Is there a value? Is it long enough to be a prefix?
    if (!typed || typed.length < 3) {
      return;
    }

    const newPrefix = getPrefix(typed) || this.currentPrefix;

    if (this.canChangePrefix(newPrefix)) {
      if (RADIO_PREFIXES[newPrefix!]) {
        this.setState({ buttonContent: RADIO_PREFIXES[newPrefix!]?.label });
      } else if (LANGUAGE_PREFIXES[newPrefix!]) {
        this.setState({ buttonContent: LANGUAGE_PREFIXES[newPrefix!]?.label });
      }
      this.currentPrefix = newPrefix;
      this.setValue(typed.slice(3));
      this.channelIterator.set('Say');
    }
  }

  canChangePrefix(newPrefix: string | null) {
    if (!newPrefix || newPrefix === this.currentPrefix) {
      return false;
    }

    if (RADIO_PREFIXES[newPrefix]) {
      return true;
    }

    const newLanguage = LANGUAGE_PREFIXES[newPrefix];
    if (newLanguage) {
      // Do we know this language?
      if (!this.languages.includes(newLanguage.id)) {
        return false;
      }
      // Are we on the default channel with no prefix?
      if (
        !this.channelIterator.isSay() ||
        (this.currentPrefix && RADIO_PREFIXES[this.currentPrefix])
      ) {
        return false;
      }
    }

    return true;
  }

  handleKeyDown(event) {
    switch (event.key) {
      case KEY.Up:
      case KEY.Down:
        event.preventDefault();
        this.handleArrowKeys(event.key);
        break;

      case KEY.Delete:
      case KEY.Backspace:
        this.handleBackspaceDelete();
        break;

      case KEY.Enter:
        event.preventDefault();
        this.handleEnter();
        break;

      case KEY.Tab:
        event.preventDefault();
        this.handleIncrementChannel();
        break;

      case KEY.Escape:
        this.handleClose();
        break;
    }
  }

  handleOpen = (data: ByondOpen) => {
    const { channel, mapfocus } = data;
    if (!mapfocus) {
      return;
    }

    setTimeout(() => {
      this.innerRef.current?.focus();
    }, 0);

    // Catches the case where the modal is already open
    if (this.channelIterator.isSay()) {
      this.channelIterator.set(channel);
    }
    this.setState({ buttonContent: this.channelIterator.current() });

    windowOpen(this.channelIterator.current(), this.scale);
  };

  handleProps = (data: ByondProps) => {
    const { maxLength, lightMode, extraChannels, scale, languages } = data;
    this.maxLength = maxLength;
    this.lightMode = !!lightMode;
    this.scale = !!scale;
    this.extraChannels = extraChannels;
    this.languages = languages;

    if (!this.scale) {
      window.document.body.style['zoom'] = `${100 / window.devicePixelRatio}%`;
    } else {
      window.document.body.style['zoom'] = null;
    }
  };

  reset() {
    this.setValue('');
    this.setSize();
    this.setState({
      buttonContent: this.channelIterator.current(),
    });
  }

  setSize(length = 0) {
    let newSize: WindowSize;

    if (length > LineLength.Medium) {
      newSize = WindowSize.Large;
    } else if (length <= LineLength.Medium && length > LineLength.Small) {
      newSize = WindowSize.Medium;
    } else {
      newSize = WindowSize.Small;
    }

    if (this.state.size !== newSize) {
      this.setState({ size: newSize });
      windowSet(newSize, this.scale);
    }
  }

  setValue(value: string) {
    const textArea = this.innerRef.current;
    if (textArea) {
      textArea.value = value;
    }
  }

  render() {
    const theme =
      (this.lightMode && 'lightMode') ||
      (this.currentPrefix && RADIO_PREFIXES[this.currentPrefix])?.id ||
      this.channelIterator.current().toLowerCase();

    return (
      <div className={`window window-${theme} window-${this.state.size}`}>
        <Dragzone position="top" theme={theme} />
        <div className="window__content">
          <Dragzone position="left" theme={theme} />
          {!!theme && (
            <button
              className={`button button-${theme}`}
              onClick={this.handleIncrementChannel}
              type="button"
            >
              {this.state.buttonContent}
            </button>
          )}
          <textarea
            className={`textarea textarea-${theme}`}
            maxLength={this.maxLength}
            onInput={this.handleInput}
            onKeyDown={this.handleKeyDown}
            ref={this.innerRef}
          />
          {!!theme && (
            <button
              key="escape"
              className={`button button-${theme}`}
              onClick={this.handleClose}
              type="submit"
              style={{ width: '2rem', marginRight: '5px' }}
            >
              X
            </button>
          )}
          <Dragzone position="right" theme={theme} />
        </div>
        <Dragzone position="bottom" theme={theme} />
      </div>
    );
  }
}

const Dragzone = ({
  theme,
  position,
}: {
  readonly theme: string;
  readonly position: string;
}) => {
  // Horizontal or vertical?
  const location =
    position === 'left' || position === 'right' ? 'vertical' : 'horizontal';

  return (
    <div
      className={`dragzone-${location} dragzone-${position} dragzone-${theme}`}
      onMouseDown={dragStartHandler}
    />
  );
};
