import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// GERMAN KEYBOARD LAYOUTS

/// GERMAN KEYBOARD IN WHATSAPP STYLE
const List<List> germanDefaultLayout = [
  // Row 1
  const ['q', 'w', 'e', 'r', 't', 'z', 'u', 'i', 'o', 'p', 'ü'],
  // Row 2
  const [VirtualKeyboardKeyAction.SpacerBlock, 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ö', 'ä'],
  // Row 3
  const [VirtualKeyboardKeyAction.Shift, 'y', 'x', 'c', 'v', 'b', 'n', 'm', 'ß', VirtualKeyboardKeyAction.Backspace],
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

const List<List> germanSpecialCharactersLayout = [
  // Row 1
  const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
  // Row 2
  const [VirtualKeyboardKeyAction.Empty, '@', '#', '€', '_', '&', '-', '+', '(', ')', '/'],
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

const List<List> germanOtherSpecialCharactersLayout = [
  // Row 1
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

/// NORMAL GERMAN KEYBOARD WITH SPECIAL CHARACTERS HIDDEN BEHIND A SPECIAL CHARACTERS BUTTON
// const List<List> germanDefaultLayout = [
//   // Row 1
//   const ['^', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'ß', ','],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'z', 'u', 'i', 'o', 'p', 'ü', '+', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ö', 'ä', '#', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'y', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     // '<',
//     VirtualKeyboardKeyAction.Space,
//     '',
//     // '>',
//     // '@',
//   ]
// ];
//
// const List<List> germanSpecialCharactersLayout = [
//   // Row 1
//   const ['°', '!', '"', '§', '\$', '%', '&', '/', '(', ')', '=', '?', '`'],
//   // Row 2
//   const ['', '', '€', '', '', '', '', '', '', '', '', '*', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['', '', '', '', '', '', '', '', '@', '', '', '\'', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, '<', '>', '', '', '', '', '', ';', ':', '_', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     // '@',
//     VirtualKeyboardKeyAction.Space,
//     '',
//     // '&',
//     // '_',
//   ]
// ];

/// ALL CHARACTERS AND NO SPECIAL CHARACTERS BUTTON
// const List<List> germanDefaultLayout = [
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
// const List<List> germanSpecialCharactersLayout = [
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
