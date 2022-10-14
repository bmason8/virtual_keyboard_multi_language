import 'package:flutter/material.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

class PopupVirtualKey extends StatelessWidget {
  const PopupVirtualKey({
    Key? key,
    required this.virtualKeyboardKey,
    required this.textStyle,
    this.keyContainerColor,
    required this.isShiftEnabled,
    required this.onKeyPress,
  }) : super(key: key);

  final VirtualKeyboardKey virtualKeyboardKey;
  final TextStyle textStyle;
  final Color? keyContainerColor;
  final bool isShiftEnabled;
  final Function onKeyPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onKeyPress(virtualKeyboardKey);
      },
      child: Container(
        color: this.keyContainerColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Text(
            isShiftEnabled ? virtualKeyboardKey.capsText! : virtualKeyboardKey.text!,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
