part of virtual_keyboard_multi_language;

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRowsNumeric = [
  // Row 1
  const [
    '1',
    '2',
    '3',
  ],
  // Row 1
  const [
    '4',
    '5',
    '6',
  ],
  // Row 1
  const [
    '7',
    '8',
    '9',
  ],
  // Row 1
  const [
    '.',
    '0',
  ],
];

/// Returns a list of `VirtualKeyboardKey` objects for Numeric keyboard.
List<VirtualKeyboardKey> _getKeyboardRowKeysNumeric(rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(_keyRowsNumeric[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRowsNumeric[rowNum][keyNum];

    // Create and return new VirtualKeyboardKey object.
    return VirtualKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VirtualKeyboardKeyType.String,
    );
  });
}

/// Returns a list of `VirtualKeyboardKey` objects.
List<VirtualKeyboardKey> _getKeyboardRowKeys(VirtualKeyboardLayoutKeys layoutKeys, rowNum, bool getSpecialCharacters) {
  // Generate VirtualKeyboardKey objects for each row.
  if (getSpecialCharacters) {
    return List.generate(layoutKeys.activeLayout.specialCharactersLayout[rowNum].length, (int keyNum) {
      // Get key string value.
      // print('layoutKeys.activeLayout[rowNum][keyNum]: ${layoutKeys.activeLayout[rowNum][keyNum]}');
      if (layoutKeys.activeLayout.specialCharactersLayout[rowNum][keyNum] is String) {
        String key = layoutKeys.activeLayout.specialCharactersLayout[rowNum][keyNum];

        // Create and return new VirtualKeyboardKey object.
        return VirtualKeyboardKey(
          text: key,
          capsText: key.toUpperCase(),
          keyType: VirtualKeyboardKeyType.String,
        );
      } else {
        var action = layoutKeys.activeLayout.specialCharactersLayout[rowNum][keyNum] as VirtualKeyboardKeyAction;
        return VirtualKeyboardKey(keyType: VirtualKeyboardKeyType.Action, action: action);
      }
    });
  } else {
    return List.generate(layoutKeys.activeLayout.defaultLayout[rowNum].length, (int keyNum) {
      // Get key string value.
      // print('layoutKeys.activeLayout[rowNum][keyNum]: ${layoutKeys.activeLayout[rowNum][keyNum]}');
      if (layoutKeys.activeLayout.defaultLayout[rowNum][keyNum] is String) {
        String key = layoutKeys.activeLayout.defaultLayout[rowNum][keyNum];

        // Create and return new VirtualKeyboardKey object.
        return VirtualKeyboardKey(
          text: key,
          capsText: key.toUpperCase(),
          keyType: VirtualKeyboardKeyType.String,
        );
      } else {
        var action = layoutKeys.activeLayout.defaultLayout[rowNum][keyNum] as VirtualKeyboardKeyAction;
        return VirtualKeyboardKey(keyType: VirtualKeyboardKeyType.Action, action: action);
      }
    });
  }
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRows(VirtualKeyboardLayoutKeys layoutKeys, bool getSpecialCharacters) {
  // Generate lists for each keyboard row.
  if (getSpecialCharacters) {
    return List.generate(
        layoutKeys.activeLayout.specialCharactersLayout.length, (int rowNum) => _getKeyboardRowKeys(layoutKeys, rowNum, true));
  } else {
    return List.generate(layoutKeys.activeLayout.defaultLayout.length, (int rowNum) => _getKeyboardRowKeys(layoutKeys, rowNum, false));
  }
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRowsNumeric() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRowsNumeric.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VirtualKeyboardKey> rowKeys = [];

    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 3:
        // String keys.
        rowKeys.addAll(_getKeyboardRowKeysNumeric(rowNum));

        // Right Shift
        rowKeys.add(
          VirtualKeyboardKey(keyType: VirtualKeyboardKeyType.Action, action: VirtualKeyboardKeyAction.Backspace),
        );
        break;
      default:
        rowKeys = _getKeyboardRowKeysNumeric(rowNum);
    }

    return rowKeys;
  });
}
