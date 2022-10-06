part of virtual_keyboard_multi_language;

/// The default keyboard height. Can we overriden by passing
///  `height` argument to `VirtualKeyboard` widget.
const double _virtualKeyboardDefaultHeight = 300;

const int _virtualKeyboardBackspaceEventPeriod = 250;

/// Virtual Keyboard widget.
class VirtualKeyboard extends StatefulWidget {
  /// Keyboard Type: Should be initiated in creation time.
  final VirtualKeyboardType type;

  /// Callback for Key press event. Called with pressed `Key` object.
  final Function? onKeyPress;

  /// Virtual keyboard height. Default is 300
  final double height;

  /// Padding between keyboard rows
  final double rowVerticalPadding;

  /// Horizontal padding around each key
  final double horizontalKeyPadding;

  /// Virtual keyboard height. Default is full screen width
  final double? width;

  /// Color for key texts and icons.
  final Color textColor;

  /// Font size for keyboard keys.
  final double fontSize;

  /// Color for the shift click characters in the top right while viewing the default keyboard layout.
  final Color shiftClickTextColor;

  /// Font size for the shift click characters in the top right while viewing the default keyboard layout.
  final double shiftClickFontSize;

  /// Color of the Key cap. Default is Colors.transparent
  final Color keyContainerColor;

  /// Color of the Special Character keys
  final Color actionKeysContainerColor;

  /// Border Radius for key caps
  final double keyCapBorderRadius;

  /// Shift click key (top right) padding while viewing keyboard in the default view
  final double shiftClickKeyPadding;

  /// the custom layout for multi or single language
  final VirtualKeyboardLayoutKeys? customLayoutKeys;

  /// the text controller go get the output and send the default input
  final TextEditingController? textController;

  /// The builder function will be called for each Key object.
  final Widget Function(BuildContext context, VirtualKeyboardKey key)? builder;

  /// Set to true if you want only to show Caps letters.
  final bool alwaysCaps;

  /// inverse the layout to fix the issues with right to left languages.
  final bool reverseLayout;

  /// used for multi-languages with default layouts, the default is English only
  /// will be ignored if customLayoutKeys is not null
  final List<VirtualKeyboardDefaultLayouts>? defaultLayouts;

  VirtualKeyboard(
      {Key? key,
      required this.type,
      this.onKeyPress,
      this.builder,
      this.width,
      this.defaultLayouts,
      this.customLayoutKeys,
      this.textController,
      this.reverseLayout = false,
      this.height = _virtualKeyboardDefaultHeight,
      this.rowVerticalPadding = 0.0,
      this.horizontalKeyPadding = 4.0,
      this.textColor = Colors.black,
      this.fontSize = 14,
      this.shiftClickTextColor = Colors.black,
      this.shiftClickFontSize = 10,
      this.keyContainerColor = Colors.transparent,
      this.actionKeysContainerColor = Colors.transparent,
      this.keyCapBorderRadius = 0.0,
      this.shiftClickKeyPadding = 6.0,
      this.alwaysCaps = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VirtualKeyboardState();
  }
}

/// Holds the state for Virtual Keyboard class.
class _VirtualKeyboardState extends State<VirtualKeyboard> {
  late VirtualKeyboardType type;
  Function? onKeyPress;
  late TextEditingController textController;
  // The builder function will be called for each Key object.
  Widget Function(BuildContext context, VirtualKeyboardKey key)? builder;
  late double height;
  double? width;
  late Color textColor;
  late Color shiftClickColor;
  late double fontSize;
  late double shiftClickFontSize;
  late bool alwaysCaps;
  late bool reverseLayout;
  late VirtualKeyboardLayoutKeys customLayoutKeys;
  // Text Style for keys.
  late TextStyle textStyle;
  late TextStyle shiftClickTextStyle;

  // True if shift is enabled.
  bool isShiftEnabled = false;
  bool isSpecialCharactersEnabled = false;
  bool isOtherSpecialCharactersEnabled = false;

  void _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      textController.text += ((isShiftEnabled ? key.capsText : key.text) ?? '');
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (textController.text.length == 0) return;
          textController.text = textController.text.substring(0, textController.text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          textController.text += '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          textController.text += (key.text ?? '');
          break;
        case VirtualKeyboardKeyAction.Shift:
          break;
        default:
      }
    }

    onKeyPress?.call(key);
  }

  @override
  dispose() {
    if (widget.textController == null) // dispose if created locally only
      textController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(VirtualKeyboard oldWidget) {
    // Used to ensure the widget rebuilds correctly when dismissed while viewing special characters layout
    super.didUpdateWidget(oldWidget);
    setState(() {
      type = widget.type;
      builder = widget.builder;
      onKeyPress = widget.onKeyPress;
      height = widget.height;
      width = widget.width;
      textColor = widget.textColor;
      fontSize = widget.fontSize;
      shiftClickColor = widget.shiftClickTextColor;
      shiftClickFontSize = widget.shiftClickFontSize;
      alwaysCaps = widget.alwaysCaps;
      reverseLayout = widget.reverseLayout;
      textController = widget.textController ?? textController;
      customLayoutKeys = widget.customLayoutKeys ?? customLayoutKeys;
      // Init the Text Style for keys.
      textStyle = TextStyle(
        fontSize: fontSize,
        color: textColor,
      );
      shiftClickTextStyle = TextStyle(
        fontSize: shiftClickFontSize,
        color: shiftClickColor,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    textController = widget.textController ?? TextEditingController();
    width = widget.width;
    type = widget.type;
    customLayoutKeys =
        widget.customLayoutKeys ?? VirtualKeyboardDefaultLayoutKeys(widget.defaultLayouts ?? [VirtualKeyboardDefaultLayouts.English]);
    builder = widget.builder;
    onKeyPress = widget.onKeyPress;
    height = widget.height;
    textColor = widget.textColor;
    fontSize = widget.fontSize;
    shiftClickColor = widget.shiftClickTextColor;
    shiftClickFontSize = widget.shiftClickFontSize;
    alwaysCaps = widget.alwaysCaps;
    reverseLayout = widget.reverseLayout;
    // Init the Text Style for keys.
    textStyle = TextStyle(
      fontSize: fontSize,
      color: textColor,
    );
    shiftClickTextStyle = TextStyle(
      fontSize: shiftClickFontSize,
      color: shiftClickColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return type == VirtualKeyboardType.Numeric ? _numeric() : _alphanumeric();
  }

  Widget _alphanumeric() {
    int numberOfRows = _getKeyboardRows(customLayoutKeys, false).length;
    // print('numberOfRows: $numberOfRows');
    // print('rowPadding: ${widget.rowVerticalPadding}');
    // double testHeight = (widget.rowVerticalPadding * numberOfRows);
    // print('height: ${testHeight + height}');
    return Container(
      height: height + ((widget.rowVerticalPadding + 4) * numberOfRows),
      // height: height,
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows(),
      ),
    );
  }

  Widget _numeric() {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows(),
      ),
    );
  }

  /// Returns the rows for keyboard.
  List<Widget> _rows() {
    // Get the keyboard Rows
    List<List<VirtualKeyboardKey>> keyboardRows =
        type == VirtualKeyboardType.Numeric ? _getKeyboardRowsNumeric() : _getKeyboardRows(customLayoutKeys, false);

    // Get the shift click characters
    List<List<VirtualKeyboardKey>> specialCharacters = _getKeyboardRows(customLayoutKeys, true);

    // Generate keyboard row.
    List<Widget> rows = List.generate(keyboardRows.length, (int rowNum) {
      var items = List.generate(keyboardRows[rowNum].length, (int keyNum) {
        // Get the VirtualKeyboardKey object.
        VirtualKeyboardKey virtualKeyboardKey = keyboardRows[rowNum][keyNum];

        VirtualKeyboardKey? shiftClickKeyboardKey;
        if (keyNum < specialCharacters[rowNum].length) {
          shiftClickKeyboardKey = specialCharacters[rowNum][keyNum];
        }

        Widget keyWidget;

        // Check if builder is specified.
        // Call builder function if specified or use default
        //  Key widgets if not.
        if (builder == null) {
          // Check the key type.
          switch (virtualKeyboardKey.keyType) {
            case VirtualKeyboardKeyType.String:
              // Draw String key.
              keyWidget =
                  _keyboardDefaultKey(virtualKeyboardKey, shiftClickKeyboardKey, (type == VirtualKeyboardType.Numeric) ? true : false);
              break;
            case VirtualKeyboardKeyType.Action:
              // Draw action key.
              keyWidget = _keyboardDefaultActionKey(virtualKeyboardKey, keyboardRows[rowNum].length, keyNum);
              break;
          }
        } else {
          // Call the builder function, so the user can specify custom UI for keys.
          keyWidget = builder!(context, virtualKeyboardKey);

          // if (keyWidget == null) {
          //   throw 'builder function must return Widget';
          // }
        }

        return keyWidget;
      });

      if (this.reverseLayout) items = items.reversed.toList();
      return Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: widget.rowVerticalPadding, horizontal: 1.0),
          // padding: (rowNum == 0 || rowNum == keyboardRows.length - 1)
          //     ? EdgeInsets.all(0.0)
          //     // ? EdgeInsets.only(bottom: widget.rowVerticalPadding)
          //     : EdgeInsets.symmetric(vertical: widget.rowVerticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Generate keyboard keys
            children: items,
          ),
        ),
      );
    });

    return rows;
  }

  // True if long press is enabled.
  bool longPress = false;

  /// Creates default UI element for keyboard Key.
  Widget _keyboardDefaultKey(VirtualKeyboardKey key, VirtualKeyboardKey? secondaryKey, bool isNumeric) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalKeyPadding, vertical: 0.0),
      child: InkWell(
        onTap: () {
          _onKeyPress(key);
        },
        child: Container(
          height: height / customLayoutKeys.activeLayout.defaultLayout.length,
          decoration: BoxDecoration(
            color: widget.keyContainerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.keyCapBorderRadius),
            ),
          ),
          child: Stack(
            children: [
              if (!isSpecialCharactersEnabled && !isOtherSpecialCharactersEnabled && !isNumeric)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: widget.shiftClickKeyPadding, right: widget.shiftClickKeyPadding),
                    child: Text(
                      secondaryKey?.text ?? '',
                      textAlign: TextAlign.center,
                      style: shiftClickTextStyle,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  alwaysCaps ? key.capsText ?? '' : (isShiftEnabled ? key.capsText : key.text) ?? '',
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
    // return Expanded(
    //     child: Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: horizontalKeyPadding, vertical: 0.0),
    //   child: InkWell(
    //     onTap: () {
    //       _onKeyPress(key);
    //     },
    //     child: Container(
    //       height: height / customLayoutKeys.activeLayout.defaultLayout.length,
    //       decoration: BoxDecoration(
    //         color: widget.keyContainerColor,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(12.0),
    //         ),
    //       ),
    //       child: Center(
    //           child: Text(
    //         alwaysCaps ? key.capsText ?? '' : (isShiftEnabled ? key.capsText : key.text) ?? '',
    //         style: textStyle,
    //       )),
    //     ),
    //   ),
    // ));
  }

  /// Creates default UI element for keyboard Action Key.
  Widget _keyboardDefaultActionKey(VirtualKeyboardKey key, int rowLength, int currentIndex) {
    // Holds the action key widget.
    Widget? actionKey;

    // Switch the action type to build action Key widget.
    switch (key.action ?? VirtualKeyboardKeyAction.SwitchLanguage) {
      case VirtualKeyboardKeyAction.Backspace:
        actionKey = GestureDetector(
            onLongPress: () {
              longPress = true;
              // Start sending backspace key events while longPress is true
              Timer.periodic(Duration(milliseconds: _virtualKeyboardBackspaceEventPeriod), (timer) {
                if (longPress) {
                  _onKeyPress(key);
                } else {
                  // Cancel timer.
                  timer.cancel();
                }
              });
            },
            onLongPressUp: () {
              // Cancel event loop
              longPress = false;
            },
            child: Container(
              // height: double.infinity,
              height: height / customLayoutKeys.activeLayout.defaultLayout.length,
              // width: double.infinity,
              // width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 3,
              width: (rowLength < 9)
                  ? (height / customLayoutKeys.activeLayout.defaultLayout.length) * 3.1
                  : (height / customLayoutKeys.activeLayout.defaultLayout.length) * 2,
              decoration: BoxDecoration(
                color: widget.actionKeysContainerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.keyCapBorderRadius),
                ),
              ),
              child: Icon(
                Icons.backspace,
                color: textColor,
              ),
            ));
        break;
      case VirtualKeyboardKeyAction.Shift:
        actionKey = Container(
            height: height / customLayoutKeys.activeLayout.defaultLayout.length,
            width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 3.2,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: widget.actionKeysContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.keyCapBorderRadius),
              ),
            ),
            child: Icon(
              Icons.arrow_upward,
              color: textColor,
            ));
        break;
      case VirtualKeyboardKeyAction.Return:
        actionKey = Container(
          height: height / customLayoutKeys.activeLayout.defaultLayout.length,
          // width: double.infinity,
          width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 3.1,
          // width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 2,
          decoration: BoxDecoration(
            color: widget.actionKeysContainerColor,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.keyCapBorderRadius),
            ),
          ),
          child: Icon(
            Icons.keyboard_return,
            color: textColor,
          ),
        );
        break;
      case VirtualKeyboardKeyAction.Space:
        actionKey = actionKey = Container(
            height: height / customLayoutKeys.activeLayout.defaultLayout.length,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.keyContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.keyCapBorderRadius),
              ),
            ),
            child: Icon(
              Icons.space_bar,
              color: textColor,
            ));
        break;
      case VirtualKeyboardKeyAction.SwitchLanguage:
        actionKey = GestureDetector(
            onTap: () {
              setState(() {
                customLayoutKeys.switchLanguage();
              });
            },
            child: Container(
              height: height / customLayoutKeys.activeLayout.defaultLayout.length,
              // width: (height / customLayoutKeys.activeLayout.defaultLayout.length) / 1.2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.actionKeysContainerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.keyCapBorderRadius),
                ),
              ),
              child: SizedBox(
                width: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(
                    //   Icons.language,
                    //   color: textColor,
                    // ),
                    Text(
                      _getCountryFlag(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ));
        break;
      case VirtualKeyboardKeyAction.SpecialCharacters:
        actionKey = GestureDetector(
          onTap: () {
            setState(() {
              isSpecialCharactersEnabled = true;
              isOtherSpecialCharactersEnabled = false;
              customLayoutKeys.switchToSpecialCharacters();
            });
          },
          child: Container(
            height: height / customLayoutKeys.activeLayout.defaultLayout.length,
            width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 2,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: widget.actionKeysContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.keyCapBorderRadius),
              ),
            ),
            child: Center(
              child: Text(
                '?123',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.shiftClickTextColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                  // fontSize: shiftClickFontSize,
                ),
              ),
            ),
          ),
        );
        break;
      case VirtualKeyboardKeyAction.SpacerBlock:
        actionKey = Container(
          height: height / customLayoutKeys.activeLayout.defaultLayout.length,
          // width: double.infinity,
          width: (height / customLayoutKeys.activeLayout.defaultLayout.length) / 2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(widget.keyCapBorderRadius),
            ),
          ),
          child: Text(
            '',
          ),
        );
        break;
      case VirtualKeyboardKeyAction.OtherSpecialCharacters:
        actionKey = GestureDetector(
          onTap: () {
            setState(() {
              isSpecialCharactersEnabled = false;
              isOtherSpecialCharactersEnabled = true;
              customLayoutKeys.switchToOtherSpecialCharacters();
            });
          },
          child: Container(
            height: height / customLayoutKeys.activeLayout.defaultLayout.length,
            // width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 3.1,
            // width: double.infinity,
            width: (height / customLayoutKeys.activeLayout.defaultLayout.length) * 2,
            decoration: BoxDecoration(
              color: widget.actionKeysContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.keyCapBorderRadius),
              ),
            ),
            child: Center(
              child: Text(
                '=\\<',
                style: TextStyle(
                  color: widget.shiftClickTextColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
        break;
      case VirtualKeyboardKeyAction.ABC:
        actionKey = GestureDetector(
          onTap: () {
            setState(() {
              isSpecialCharactersEnabled = false;
              isOtherSpecialCharactersEnabled = false;
              customLayoutKeys.switchToABCCharacters();
            });
          },
          child: Container(
            height: height / customLayoutKeys.activeLayout.defaultLayout.length,
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.actionKeysContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.keyCapBorderRadius),
              ),
            ),
            child: Center(
              child: Text(
                'ABC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.shiftClickTextColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
        break;
    }

    var wdgt = InkWell(
      onTap: () {
        if (key.action == VirtualKeyboardKeyAction.Shift) {
          if (!alwaysCaps) {
            setState(() {
              isShiftEnabled = !isShiftEnabled;
            });
          }
        }

        _onKeyPress(key);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalKeyPadding, vertical: 0.0),
        child: Container(
          alignment: Alignment.center,
          height: height / customLayoutKeys.activeLayout.defaultLayout.length,
          child: actionKey,
        ),
      ),
    );

    // Wrap the key wdgt with a different Widget based on what type of key it is
    if (key.action == VirtualKeyboardKeyAction.Space) {
      return Flexible(flex: 4, child: wdgt);
      // return Expanded(child: wdgt);
      // return SizedBox(width: (width ?? MediaQuery.of(context).size.width) / 2, child: wdgt);

    } else if (key.action == VirtualKeyboardKeyAction.SpacerBlock) {
      return wdgt;
    } else if (key.action == VirtualKeyboardKeyAction.Shift) {
      return wdgt;
    } else if (key.action == VirtualKeyboardKeyAction.Return) {
      return wdgt;
    } else if (key.action == VirtualKeyboardKeyAction.Backspace) {
      return wdgt;
    } else if (key.action == VirtualKeyboardKeyAction.SpecialCharacters) {
      return wdgt;
    } else if (key.action == VirtualKeyboardKeyAction.OtherSpecialCharacters) {
      return wdgt;
    } else {
      // return Flexible(child: wdgt);
      return Flexible(child: wdgt);
      // return Flexible(
      //     child: ConstrainedBox(
      //   constraints: BoxConstraints(
      //     // minWidth: 160,
      //     maxWidth: 180,
      //   ),
      //   child: wdgt,
      // ));

    }
  }

  String _getCountryFlag() {
    switch (widget.defaultLayouts![customLayoutKeys.activeIndex]) {
      case VirtualKeyboardDefaultLayouts.English:
        return '🇱🇷';
      case VirtualKeyboardDefaultLayouts.German:
        return '🇩🇪';
      case VirtualKeyboardDefaultLayouts.Spanish:
        return '🇪🇸';
      case VirtualKeyboardDefaultLayouts.French:
        return '🇫🇷';
      case VirtualKeyboardDefaultLayouts.Portuguese:
        return '🇵🇹';
      default:
        return '🇱🇷';
    }
  }
}
