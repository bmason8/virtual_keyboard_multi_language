import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// PORTUGUESE KEYBOARD LAYOUTS
// Default keyboard layout
const List<List> portugueseDefaultLayout = [
  // Row 1
  const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
  // Row 2
  const [
    VirtualKeyboardKeyAction.SmallSpacerBlock,
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'ḉ',
    VirtualKeyboardKeyAction.SmallSpacerBlock
  ],
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
// 2nd keyboard layout
const List<List> portugueseSpecialCharactersLayout = [
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
// 3rd keyboard layout
const List<List> portugueseOtherSpecialCharactersLayout = [
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

// TODO: THE o and a beside 'p' aren't correct
// const List<List> portugueseDefaultLayout = [
//   // Row 1
//   const ['§', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', ',', '+'],
//   // Row 2
//   const ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'õ', ',', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'ç', '~', '\\', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '-', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '',
//   ]
// ];
//
// const List<List> portugueseSpecialCharactersLayout = [
//   // Row 1
//   const ['±', '!', '"', '#', '\$', '%', '&', '/', '(', ')', '=', '?', '*'],
//   // Row 2
//   const ['', '', '', '', '', '', '', '', '', '', 'ã', '`', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['', '', '', '', '', '', '', '', '', '', '^', '|', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, '<', '>', '', '', '', '', '', ';', ':', '_', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '',
//   ]
// ];
