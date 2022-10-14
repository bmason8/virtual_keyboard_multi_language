import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/src/popup_key_retriever.dart';
import 'package:virtual_keyboard_multi_language/src/popup_virtual_key.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

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
    required this.keyCapBorderRadius,
    required this.horizontalKeyPadding,
    required this.shiftClickKeyPadding,
    required this.keyContainerColor,
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
  final double keyCapBorderRadius;
  final double horizontalKeyPadding;
  final double shiftClickKeyPadding;
  final Color keyContainerColor;
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

    popupKeyRetriever = PopupKeyRetriever(virtualKeyboardKey: widget.virtualKey);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      renderBox = context.findRenderObject() as RenderBox;
      size = renderBox.size;
      offset = renderBox.localToGlobal(Offset.zero);
      _buildOverlay();
    });
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
              elevation: 10,
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
                // color: widget.keyContainerColor,
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
    List<VirtualKeyboardKey> additionalKeys = popupKeyRetriever.getAdditionalRelatedSymbols(widget.virtualKey.text!);
    double topOffsetAdjustment = (additionalKeys.length > 6) ? 2.7 : 1.8;
    entry = OverlayEntry(
        builder: (context) => Positioned(
              top: offset.dy - (size.height * topOffsetAdjustment),
              left: offset.dx - 24,
              child: GestureDetector(
                onLongPress: () {},
                child: Card(
                  color: widget.keyContainerColor,
                  elevation: 8,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: size.width,
                      maxWidth: size.width * 1.8,
                    ),
                    child: Wrap(
                      children: additionalKeys
                          .map((VirtualKeyboardKey virtualKeyboardKey) => DragTarget<String>(
                                builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                                  return PopupVirtualKey(
                                    virtualKeyboardKey: VirtualKeyboardKey(
                                        text: virtualKeyboardKey.text,
                                        capsText: virtualKeyboardKey.capsText,
                                        keyType: VirtualKeyboardKeyType.String),
                                    textStyle: widget.textStyle,
                                    keyContainerColor: widget.keyContainerColor,
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

  popupVirtualKeyPress(VirtualKeyboardKey virtualKey) {
    widget.onKeyPress(virtualKey);
  }
}
