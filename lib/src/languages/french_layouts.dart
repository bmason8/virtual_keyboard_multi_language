import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// FRENCH KEYBOARD LAYOUTS
const List<List> frenchDefaultLayout = [
  // Row 1
  const ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
  // Row 2
  const [
    VirtualKeyboardKeyAction.SmallSpacerBlock,
    'q',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    VirtualKeyboardKeyAction.SmallSpacerBlock
  ],
  // Row 3
  const [VirtualKeyboardKeyAction.Shift, 'w', 'x', 'c', 'v', 'b', 'n', 'n', '\'', VirtualKeyboardKeyAction.Backspace],
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
const List<List> frenchSpecialCharactersLayout = [
  // Row 1
  const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
  // Row 2
  const ['@', '#', '€', '_', '&', '-', '+', '(', ')', '/'],
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
const List<List> frenchOtherSpecialCharactersLayout = [
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

// const List<List> frenchDefaultLayout = [
//   // Row 1
//   const ['#', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '°', '_'],
//   // Row 2
//   const ['a', 'z', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '^', '\$', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const ['q', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'ù', '\`', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, 'w', 'x', 'c', 'v', 'b', 'n', ',', ';', ':', '=', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '',
//   ]
// ];
// const List<List> frenchSpecialCharactersLayout = [
//   // Row 1
//   // French specific characters
//   const ['@', '&', 'é', '"', '\'', '(', '§', 'è', '!', 'ç', 'à', ')', '-'],
//   // Row 2
//   const [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '€', '¨', '*', VirtualKeyboardKeyAction.Backspace],
//   // Row 3
//   const [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '%', '£', VirtualKeyboardKeyAction.Return],
//   // Row 4
//   const [VirtualKeyboardKeyAction.Shift, '<', '>', ' ', ' ', ' ', ' ', '?', '.', '/', '+', VirtualKeyboardKeyAction.SpecialCharacters],
//   // Row 5
//   const [
//     VirtualKeyboardKeyAction.SwitchLanguage,
//     VirtualKeyboardKeyAction.Space,
//     '',
//   ]
// ];
