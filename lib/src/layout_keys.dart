part of virtual_keyboard_multi_language;
//import '../virtual_keyboard_multi_language.dart';

abstract class VirtualKeyboardLayoutKeys {
  int activeIndex = 0;

  // List<List> get defaultEnglishLayout => _defaultEnglishLayout;
  // // List<List> get defaultArabicLayout => _defaultArabicLayout;
  // List<List> get defaultItalianLayout => _defaultItalianLayout;

  // List<List> get activeLayout => getLanguage(activeIndex);
  // int getLanguagesCount();
  // List<List> getLanguage(int index);

  // List<List> getLanguage(int index);

  KeyboardLanguage get defaultEnglishLayout => _englishKeyboardLayout;
  KeyboardLanguage get defaultGermanLayout => _germanKeyboardLayout;
  KeyboardLanguage get defaultSpanishLayout => _spanishKeyboardLayout;
  KeyboardLanguage get defaultFrenchLayout => _frenchKeyboardLayout;
  KeyboardLanguage get defaultPortugueseLayout => _portugueseKeyboardLayout;
  // KeyboardLanguage get defaultItalianLayout => _italianKeyboardLayout;

  KeyboardLanguage get activeLayout => getLanguage(activeIndex);
  int getLanguagesCount();
  KeyboardLanguage getLanguage(int index);

  void switchLanguage() {
    if ((activeIndex + 1) == getLanguagesCount())
      activeIndex = 0;
    else
      activeIndex++;
  }

  void switchToSpecialCharacters(bool currentUsingDefaultLayout) {
    switch (activeIndex) {
      case 0:
        // break;
        if (currentUsingDefaultLayout) {
          _englishKeyboardLayout = KeyboardLanguage(_englishSpecialCharactersLayout, _englishDefaultLayout);
        } else {
          _englishKeyboardLayout = KeyboardLanguage(_englishDefaultLayout, _englishSpecialCharactersLayout);
        }
        break;
      case 1:
        if (currentUsingDefaultLayout) {
          _germanKeyboardLayout = KeyboardLanguage(_germanSpecialCharactersLayout, _germanDefaultLayout);
        } else {
          _germanKeyboardLayout = KeyboardLanguage(_germanDefaultLayout, _germanSpecialCharactersLayout);
        }
        break;
      case 2:
        if (currentUsingDefaultLayout) {
          _spanishKeyboardLayout = KeyboardLanguage(_spanishSpecialCharactersLayout, _spanishDefaultLayout);
        } else {
          _spanishKeyboardLayout = KeyboardLanguage(_spanishDefaultLayout, _spanishSpecialCharactersLayout);
        }
        break;
      case 3:
        if (currentUsingDefaultLayout) {
          _frenchKeyboardLayout = KeyboardLanguage(_frenchSpecialCharactersLayout, _frenchDefaultLayout);
        } else {
          _frenchKeyboardLayout = KeyboardLanguage(_frenchDefaultLayout, _frenchSpecialCharactersLayout);
        }
        break;
      case 4:
        if (currentUsingDefaultLayout) {
          _portugueseKeyboardLayout = KeyboardLanguage(_portugueseSpecialCharactersLayout, _portugueseDefaultLayout);
        } else {
          _portugueseKeyboardLayout = KeyboardLanguage(_portugueseDefaultLayout, _portugueseSpecialCharactersLayout);
        }
        break;
    }
    //   case 5:
    //     if (currentUsingDefaultLayout) {
    //       _italianKeyboardLayout = KeyboardLanguage(_italianSpecialCharactersLayout, _italianDefaultLayout);
    //     } else {
    //       _italianKeyboardLayout = KeyboardLanguage(_italianDefaultLayout, _italianSpecialCharactersLayout);
    //     }
    //     break;
  }

  // VirtualKeyboardLayoutKeys getSecondaryKeys() {
  //   switch (activeLayout) {
  //     case defaultEnglishLayout:
  //       return _englishSpecialCharactersLayout;
  //   }
  // }
}

class VirtualKeyboardDefaultLayoutKeys extends VirtualKeyboardLayoutKeys {
  List<VirtualKeyboardDefaultLayouts> defaultLayouts;
  VirtualKeyboardDefaultLayoutKeys(this.defaultLayouts);

  int getLanguagesCount() => defaultLayouts.length;

  // List<List> getLanguage(int index) {
  //   switch (defaultLayouts[index]) {
  //     case VirtualKeyboardDefaultLayouts.English:
  //       return _defaultEnglishLayout;
  //     case VirtualKeyboardDefaultLayouts.Italian:
  //       return _defaultItalianLayout;
  //     default:
  //   }
  //   return _defaultEnglishLayout;
  // }
  KeyboardLanguage getLanguage(int index) {
    switch (defaultLayouts[index]) {
      case VirtualKeyboardDefaultLayouts.English:
        return _englishKeyboardLayout;
      case VirtualKeyboardDefaultLayouts.German:
        return _germanKeyboardLayout;
      case VirtualKeyboardDefaultLayouts.Spanish:
        return _spanishKeyboardLayout;
      case VirtualKeyboardDefaultLayouts.French:
        return _frenchKeyboardLayout;
      case VirtualKeyboardDefaultLayouts.Portuguese:
        return _portugueseKeyboardLayout;
      default:
    }
    return _englishKeyboardLayout;
  }
}

KeyboardLanguage _englishKeyboardLayout = KeyboardLanguage(_englishDefaultLayout, _englishSpecialCharactersLayout);
KeyboardLanguage _germanKeyboardLayout = KeyboardLanguage(_germanDefaultLayout, _germanSpecialCharactersLayout);
KeyboardLanguage _spanishKeyboardLayout = KeyboardLanguage(_spanishDefaultLayout, _spanishSpecialCharactersLayout);
KeyboardLanguage _frenchKeyboardLayout = KeyboardLanguage(_frenchDefaultLayout, _frenchSpecialCharactersLayout);
KeyboardLanguage _portugueseKeyboardLayout = KeyboardLanguage(_portugueseDefaultLayout, _portugueseSpecialCharactersLayout);
// KeyboardLanguage _italianKeyboardLayout = KeyboardLanguage(_italianDefaultLayout, _italianSpecialCharactersLayout);

// const List<List<List>> _defaultEnglishLayout = [
//   // Row 1
//   const [
//     ['1', 'è'],
//     ['2', 'ù'],
//     ['3'],
//     ['4'],
//     ['5'],
//     ['6'],
//     ['7'],
//     ['8'],
//     ['9'],
//     ['0'],
//   ],
//   // // Row 2
//   // const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', VirtualKeyboardKeyAction.Backspace],
//   // // Row 3
//   // const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', VirtualKeyboardKeyAction.Return],
//   // // Row 4
//   // const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.Shift],
//   // // Row 5
//   // const [
//   //   VirtualKeyboardKeyAction.SwitchLanguage,
//   //   '@',
//   //   VirtualKeyboardKeyAction.Space,
//   //   '&',
//   //   '_',
//   // ]
// ];
/// Keys for Virtual Keyboard's rows.
/// ALL CHARACTERS AND NO SPECIAL CHARACTERS BUTTON
// const List<List> _englishDefaultLayout = [
//   // Row 1
//   const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
//   // English specific characters
//   const ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '+'],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\\', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/'],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     '@',
//     VirtualKeyboardKeyAction.Space,
//     '_',
//     VirtualKeyboardKeyAction.SpecialCharacters,
//   ]
// ];

/// NORMAL ENGLISH KEYBOARD WITH SPECIAL CHARACTERS HIDDEN BEHIND A SPECIAL CHARACTERS BUTTON
const List<List> _englishDefaultLayout = [
  // Row 1
  const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', VirtualKeyboardKeyAction.Backspace],
  // Row 2
  const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\\'],
  // Row 3
  const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    // '',
    // '@',
    VirtualKeyboardKeyAction.Space,
    '',
    // '_',
    // VirtualKeyboardKeyAction.SpecialCharacters,
  ]
];

const List<List> _englishSpecialCharactersLayout = [
  // English specific characters
  const ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '_', '+', VirtualKeyboardKeyAction.Backspace],
  // Row 2
  const ['', '', '', '', '', '', '', '', '', '', '{', '}', '|'],
  // Row 3
  const ['', '', '', '', '', '', '', '', '', ':', '"', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [
    VirtualKeyboardKeyAction.Shift,
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '<',
    '>',
    '?',
    VirtualKeyboardKeyAction.SpecialCharacters,
  ],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    // '@',
    VirtualKeyboardKeyAction.Space,
    '',
    // VirtualKeyboardKeyAction.SpecialCharacters,
  ]
];

/// GERMAN KEYBOARD LAYOUTS
/// ALL CHARACTERS AND NO SPECIAL CHARACTERS BUTTON
// const List<List> _germanDefaultLayout = [
//   // Row 1
//   const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
//   // German specific characters
//   const ['!', '"', '§', '\$', '/', '(', ')', '=', 'ß', '`'],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'z', 'u', 'i', 'o', 'p', 'ü', '+', '*', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ö', 'ä', '#', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'y', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', ';', ':', '_'],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     '<',
//     VirtualKeyboardKeyAction.Space,
//     '>',
//     '@',
//   ]
// ];
//
// const List<List> _germanSpecialCharactersLayout = [
//   // Row 1
//   const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
//   // Row 2
//   const ['q', 'w', '€', 'r', 't', 'z', 'u', 'i', 'o', 'p', 'ü', '*', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', '@', 'ö', 'ä', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'y', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     '@',
//     VirtualKeyboardKeyAction.Space,
//     '&',
//     '_',
//   ]
// ];

/// NORMAL GERMAN KEYBOARD WITH SPECIAL CHARACTERS HIDDEN BEHIND A SPECIAL CHARACTERS BUTTON
const List<List> _germanDefaultLayout = [
  // Row 1
  const ['^', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'ß', ','],
  // Row 2
  const ['q', 'w', 'e', 'r', 't', 'z', 'u', 'i', 'o', 'p', 'ü', '+', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ö', 'ä', '#', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, 'y', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    // '<',
    VirtualKeyboardKeyAction.Space,
    '',
    // '>',
    // '@',
  ]
];

const List<List> _germanSpecialCharactersLayout = [
  // Row 1
  const ['°', '!', '"', '§', '\$', '%', '&', '/', '(', ')', '=', '?', '`'],
  // Row 2
  const ['', '', '€', '', '', '', '', '', '', '', '', '*', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['', '', '', '', '', '', '', '', '@', '', '', '\'', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, '<', '>', '', '', '', '', '', ';', ':', '_', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    // '@',
    VirtualKeyboardKeyAction.Space,
    '',
    // '&',
    // '_',
  ]
];

/// SPANISH KEYBOARD LAYOUTS
const List<List> _spanishDefaultLayout = [
  // Row 1
  // TODO: THIS o isn't correct
  const ['Ọ', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ',', '¿'],
  // Row 2
  const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '`', '+', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ñ', ',', 'ç', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];
const List<List> _spanishSpecialCharactersLayout = [
  // Row 1
  const ['a', '!', '"', '·', '\$', '%', '&', '/', '(', ')', '=', '?', '¡'],
  // Row 2
  const ['\\', '|', '€', '@', '#', '', '', '', '[', ']', '^', '*', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['', '', '', '', '', '', '', '', '', '¨', '{', '}', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, '<', '>', '', '', '', '', '', ';', ':', '_', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];

/// FRENCH KEYBOARD LAYOUTS
const List<List> _frenchDefaultLayout = [
  // Row 1
  const ['#', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '°', '_'],
  // Row 2
  const ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '^', '\$', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['q', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'ù', '\`', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, 'w', 'x', 'c', 'v', 'b', 'n', ',', ';', ':', '=', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];
const List<List> _frenchSpecialCharactersLayout = [
  // Row 1
  // French specific characters
  const ['@', '&', 'é', '"', '\'', '(', '§', 'è', '!', 'ç', 'à', ')', '-'],
  // Row 2
  const [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '€', '¨', '*', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '%', '£', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, '<', '>', ' ', ' ', ' ', ' ', '?', '.', '/', '+', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];

/// PORTUGUESE KEYBOARD LAYOUTS
// TODO: THE o and a beside 'p' aren't correct
const List<List> _portugueseDefaultLayout = [
  // Row 1
  const ['§', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ',', '+'],
  // Row 2
  const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'õ', ',', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ç', '~', '\\', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];

const List<List> _portugueseSpecialCharactersLayout = [
  // Row 1
  const ['±', '!', '"', '#', '\$', '%', '&', '/', '(', ')', '=', '?', '*'],
  // Row 2
  const ['', '', '', '', '', '', '', '', '', '', 'ã', '`', VirtualKeyboardKeyAction.Backspace],
  // Row 3
  const ['', '', '', '', '', '', '', '', '', '', '^', '|', VirtualKeyboardKeyAction.Return],
  // Row 4
  const [VirtualKeyboardKeyAction.Shift, '<', '>', '', '', '', '', '', ';', ':', '_', VirtualKeyboardKeyAction.SpecialCharacters],
  // Row 5
  const [
    VirtualKeyboardKeyAction.SwitchLanguage,
    VirtualKeyboardKeyAction.Space,
    '',
  ]
];

/// ITALIAN KEYBOARD LAYOUTS
// const List<List> _italianDefaultLayout = [
//   // Row 1
//   const [
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '0',
//   ],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'è', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ò', 'à', 'ù', ';', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     '@',
//     VirtualKeyboardKeyAction.Space,
//     '&',
//     '_',
//   ]
// ];
//
// const List<List> _italianSpecialCharactersLayout = [
//   // Row 1
//   const [
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '0',
//   ],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'é', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ç', 'à', '§', ';', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     '@',
//     VirtualKeyboardKeyAction.Space,
//     '&',
//     '_',
//   ]
// ];
