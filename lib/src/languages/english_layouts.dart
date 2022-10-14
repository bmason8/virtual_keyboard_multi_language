import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// NORMAL ENGLISH KEYBOARD WITH SPECIAL CHARACTERS HIDDEN BEHIND A SPECIAL CHARACTERS BUTTON
const List<List> englishDefaultLayout = [
  // Row 1
  const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
  // Row 2
  const [VirtualKeyboardKeyAction.SpacerBlock, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', VirtualKeyboardKeyAction.SpacerBlock],
  // Row 3
  const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', VirtualKeyboardKeyAction.Backspace],
  // Row 4
  const [
    VirtualKeyboardKeyAction.SpecialCharacters,
    VirtualKeyboardKeyAction.SwitchLanguage,
    ',',
    VirtualKeyboardKeyAction.Space,
    '.',
    VirtualKeyboardKeyAction.Return,
  ]
];

const List<List> englishSpecialCharactersLayout = [
  // English specific characters
  // Row 1
  const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
  // Row 2
  const ['@', '#', '\$', '_', '&', '-', '+', '(', ')', '/'],
  // Row 3
  const [VirtualKeyboardKeyAction.OtherSpecialCharacters, '*', '"', '\'', ':', ';', '!', '?', VirtualKeyboardKeyAction.Backspace],
  // Row 4
  const [
    VirtualKeyboardKeyAction.ABC,
    ',',
    VirtualKeyboardKeyAction.Space,
    '.',
    VirtualKeyboardKeyAction.Return,
  ]
];

const List<List> englishOtherSpecialCharactersLayout = [
  // English specific characters
  const ['~', '\'', '|', '•', '√', '∏', '÷', '×', '¶', '△'],
  // Row 2
  const ['£', '¥', '\$', '¢', 'ˆ', '˚', '=', '❴', '❵', '\\'],
  // Row 3
  const [VirtualKeyboardKeyAction.SpecialCharacters, '%', '©', '®', '™', '✓', '[', ']', VirtualKeyboardKeyAction.Backspace],
  // Row 4
  const [
    VirtualKeyboardKeyAction.ABC,
    '<',
    VirtualKeyboardKeyAction.Space,
    '>',
    VirtualKeyboardKeyAction.Return,
  ]
];

// /// NORMAL ENGLISH KEYBOARD WITH SPECIAL CHARACTERS HIDDEN BEHIND A SPECIAL CHARACTERS BUTTON
// const List<List> englishDefaultLayout = [
//   // Row 1
//   const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', VirtualKeyboardKeyAction.Backspace],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\\'],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     // '',
//     // '@',
//     VirtualKeyboardKeyAction.Space,
//     '',
//     // '_',
//     // VirtualKeyboardKeyAction.SpecialCharacters,
//   ]
// ];
//
// const List<List> englishSpecialCharactersLayout = [
//   // English specific characters
//   const ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '_', '+', VirtualKeyboardKeyAction.Backspace],
//   // Row 2
//   const ['', '', '', '', '', '', '', '', '', '', '{', '}', '|'],
//   // Row 3
//   const ['', '', '', '', '', '', '', '', '', ':', '"', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [
//     VirtualKeyboardKeyAction.Shift,
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '<',
//     '>',
//     '?',
//     VirtualKeyboardKeyAction.SpecialCharacters,
//   ],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     // '@',
//     VirtualKeyboardKeyAction.Space,
//     '',
//     // VirtualKeyboardKeyAction.SpecialCharacters,
//   ]
// ];

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
