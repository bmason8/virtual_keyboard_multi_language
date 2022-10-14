import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/src/popup_key_retriever.dart';
import 'package:virtual_keyboard_multi_language/src/popup_virtual_key.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// Builds a default key for the keyboard with long press and drag functionality that shows an overlay for additional characters/symbols
class KeyboardDefaultKeyWidget extends StatefulWidget {
  const KeyboardDefaultKeyWidget({
    Key? key,
    required this.virtualKey,
    this.secondaryVirtualKey,
    required this.customLayoutKeys,
    required this.height,
    required this.isNumeric,
    required this.isShiftEnabled,
    required this.alwaysCaps,
    required this.isSpecialCharactersEnabled,
    required this.isOtherSpecialCharactersEnabled,
    required this.includeSecondaryKeyInPopup,
    required this.keyCapBorderRadius,
    required this.horizontalKeyPadding,
    required this.shiftClickKeyPadding,
    required this.keyContainerColor,
    this.longPressOverlayContainerColor,
    this.longPressOverlayKeyContainerColor,
    required this.onKeyPress,
    required this.textStyle,
    required this.shiftClickTextStyle,
  }) : super(key: key);

  final VirtualKeyboardKey virtualKey;
  final VirtualKeyboardKey? secondaryVirtualKey;
  final VirtualKeyboardLayoutKeys customLayoutKeys;
  final double height;
  final bool isNumeric;
  final bool isShiftEnabled;
  final bool alwaysCaps;
  final bool isSpecialCharactersEnabled;
  final bool isOtherSpecialCharactersEnabled;
  final bool includeSecondaryKeyInPopup;
  final double keyCapBorderRadius;
  final double horizontalKeyPadding;
  final double shiftClickKeyPadding;
  final Color keyContainerColor;
  final Color? longPressOverlayContainerColor;
  final Color? longPressOverlayKeyContainerColor;
  final Function onKeyPress;
  final TextStyle textStyle;
  final TextStyle shiftClickTextStyle;

  @override
  State<KeyboardDefaultKeyWidget> createState() => _KeyboardDefaultKeyWidgetState();
}

class _KeyboardDefaultKeyWidgetState extends State<KeyboardDefaultKeyWidget> {
  late PopupKeyRetriever popupKeyRetriever;
  OverlayEntry? entry;
  late RenderBox renderBox;
  late Size size;
  late Offset offset;

  @override
  void initState() {
    super.initState();

    popupKeyRetriever = PopupKeyRetriever(includeSecondaryKey: widget.includeSecondaryKeyInPopup);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      renderBox = context.findRenderObject() as RenderBox;
      size = renderBox.size;
      offset = renderBox.localToGlobal(Offset.zero);
      _buildOverlay();
    });
  }

  @override
  void dispose() {
    entry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalKeyPadding, vertical: 0.0),
      child: Material(
        color: widget.keyContainerColor, // adding color here so the splash effect of 'onTap' doesn't get covered
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            widget.onKeyPress(widget.virtualKey);
          },
          child: LongPressDraggable(
            delay: Duration(milliseconds: 300),
            dragAnchorStrategy: (Draggable<Object> _, BuildContext __, Offset ___) => const Offset(10, 10),
            data: widget.virtualKey.text,
            onDragStarted: () {
              _insertOverlay();
            },
            onDragEnd: (_) {
              _removeOverlay();
            },
            feedback: Card(
              elevation: 12,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            child: Container(
              height: widget.height / widget.customLayoutKeys.activeLayout.defaultLayout.length,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.keyCapBorderRadius),
                ),
              ),
              child: Stack(
                children: [
                  if (!widget.isSpecialCharactersEnabled && !widget.isOtherSpecialCharactersEnabled && !widget.isNumeric)
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: widget.shiftClickKeyPadding, right: widget.shiftClickKeyPadding),
                        child: Text(
                          widget.secondaryVirtualKey?.text ?? '',
                          textAlign: TextAlign.center,
                          style: widget.shiftClickTextStyle,
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.alwaysCaps
                          ? widget.virtualKey.capsText ?? ''
                          : (widget.isShiftEnabled ? widget.virtualKey.capsText : widget.virtualKey.text) ?? '',
                      style: widget.textStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  _removeOverlay() {
    entry?.remove();
    entry = null;
  }

  _insertOverlay() {
    final overlay = Overlay.of(context)!;
    if (entry != null) {
      overlay.insert(entry!);
    } else {
      _buildOverlay();
      overlay.insert(entry!);
    }
  }

  _buildOverlay() {
    renderBox = context.findRenderObject() as RenderBox;
    size = renderBox.size;
    offset = renderBox.localToGlobal(Offset.zero);
    List<VirtualKeyboardKey> additionalKeys =
        popupKeyRetriever.getAdditionalRelatedSymbols(widget.virtualKey.text!, widget.secondaryVirtualKey);
    double topOffsetAdjustment = _calculateOffsetAdjustment(additionalKeys.length);
    entry = OverlayEntry(
        builder: (context) => Positioned(
              top: offset.dy - (size.height * topOffsetAdjustment),
              left: (additionalKeys.length > 1) ? offset.dx - 24 : offset.dx,
              child: GestureDetector(
                child: Card(
                  // color: widget.keyContainerColor,
                  color: widget.longPressOverlayContainerColor ?? widget.keyContainerColor,
                  elevation: 10,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: size.width,
                      maxWidth: size.width * 1.8,
                    ),
                    child: Wrap(
                      runSpacing: 4.0,
                      spacing: 4.0,
                      alignment: (additionalKeys.length > 1) ? WrapAlignment.start : WrapAlignment.spaceEvenly,
                      children: additionalKeys
                          .map((VirtualKeyboardKey virtualKeyboardKey) => DragTarget<String>(
                                builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                                  return PopupVirtualKey(
                                    virtualKeyboardKey: VirtualKeyboardKey(
                                      text: virtualKeyboardKey.text,
                                      capsText: virtualKeyboardKey.capsText,
                                      keyType: VirtualKeyboardKeyType.String,
                                    ),
                                    textStyle: widget.textStyle,
                                    keyContainerColor: widget.longPressOverlayKeyContainerColor,
                                    isShiftEnabled: widget.isShiftEnabled,
                                    onKeyPress: popupVirtualKeyPress,
                                  );
                                },
                                onAccept: (_) {
                                  final position = additionalKeys.indexOf(virtualKeyboardKey);
                                  VirtualKeyboardKey vk = additionalKeys[position];
                                  this.popupVirtualKeyPress(vk);
                                },
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ));
  }

  double _calculateOffsetAdjustment(int additionalKeysLength) {
    if (additionalKeysLength > 9) {
      return 3.8;
    } else if (additionalKeysLength > 7) {
      return 2.8;
    } else if (additionalKeysLength > 6) {
      return 2;
    } else if (additionalKeysLength > 4) {
      return 2;
    } else {
      return 1;
    }
  }

  popupVirtualKeyPress(VirtualKeyboardKey virtualKey) {
    widget.onKeyPress(virtualKey);
  }
}
