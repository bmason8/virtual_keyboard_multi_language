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

  void switchToSpecialCharacters() {
    switch (activeIndex) {
      case 0:
        // break;
        _englishKeyboardLayout =
            KeyboardLanguage(englishSpecialCharactersLayout, englishDefaultLayout, englishOtherSpecialCharactersLayout);
        break;
      case 1:
        _germanKeyboardLayout = KeyboardLanguage(germanSpecialCharactersLayout, germanDefaultLayout, germanOtherSpecialCharactersLayout);
        break;
      case 2:
        _spanishKeyboardLayout =
            KeyboardLanguage(spanishSpecialCharactersLayout, spanishDefaultLayout, spanishOtherSpecialCharactersLayout);
        break;
      case 3:
        _frenchKeyboardLayout = KeyboardLanguage(frenchSpecialCharactersLayout, frenchDefaultLayout, frenchOtherSpecialCharactersLayout);
        break;
      case 4:
        _portugueseKeyboardLayout = KeyboardLanguage(portugueseSpecialCharactersLayout, portugueseDefaultLayout, []);
        break;
    }
  }

  void switchToABCCharacters() {
    switch (activeIndex) {
      case 0:
        // break;
        _englishKeyboardLayout =
            KeyboardLanguage(englishDefaultLayout, englishSpecialCharactersLayout, englishOtherSpecialCharactersLayout);
        break;
      case 1:
        _germanKeyboardLayout = KeyboardLanguage(germanDefaultLayout, germanSpecialCharactersLayout, germanOtherSpecialCharactersLayout);
        break;
      case 2:
        _spanishKeyboardLayout =
            KeyboardLanguage(spanishDefaultLayout, spanishSpecialCharactersLayout, spanishOtherSpecialCharactersLayout);
        break;
      case 3:
        _frenchKeyboardLayout = KeyboardLanguage(frenchDefaultLayout, frenchSpecialCharactersLayout, frenchOtherSpecialCharactersLayout);
        break;
      case 4:
        _portugueseKeyboardLayout = KeyboardLanguage(portugueseDefaultLayout, portugueseSpecialCharactersLayout, []);
        break;
    }
  }

  // void switchToSpecialCharacters(bool currentUsingDefaultLayout) {
  //   switch (activeIndex) {
  //     case 0:
  //       // break;
  //       if (currentUsingDefaultLayout) {
  //         _englishKeyboardLayout = KeyboardLanguage(englishSpecialCharactersLayout, englishDefaultLayout, []);
  //       } else {
  //         _englishKeyboardLayout = KeyboardLanguage(englishDefaultLayout, englishSpecialCharactersLayout, []);
  //       }
  //       break;
  //     case 1:
  //       if (currentUsingDefaultLayout) {
  //         _germanKeyboardLayout = KeyboardLanguage(germanSpecialCharactersLayout, germanDefaultLayout, []);
  //       } else {
  //         _germanKeyboardLayout = KeyboardLanguage(germanDefaultLayout, germanSpecialCharactersLayout, []);
  //       }
  //       break;
  //     case 2:
  //       if (currentUsingDefaultLayout) {
  //         _spanishKeyboardLayout = KeyboardLanguage(_spanishSpecialCharactersLayout, _spanishDefaultLayout, []);
  //       } else {
  //         _spanishKeyboardLayout = KeyboardLanguage(_spanishDefaultLayout, _spanishSpecialCharactersLayout, []);
  //       }
  //       break;
  //     case 3:
  //       if (currentUsingDefaultLayout) {
  //         _frenchKeyboardLayout = KeyboardLanguage(_frenchSpecialCharactersLayout, _frenchDefaultLayout, []);
  //       } else {
  //         _frenchKeyboardLayout = KeyboardLanguage(_frenchDefaultLayout, _frenchSpecialCharactersLayout, []);
  //       }
  //       break;
  //     case 4:
  //       if (currentUsingDefaultLayout) {
  //         _portugueseKeyboardLayout = KeyboardLanguage(_portugueseSpecialCharactersLayout, _portugueseDefaultLayout, []);
  //       } else {
  //         _portugueseKeyboardLayout = KeyboardLanguage(_portugueseDefaultLayout, _portugueseSpecialCharactersLayout, []);
  //       }
  //       break;
  //   }
  // }

  void switchToOtherSpecialCharacters() {
    switch (activeIndex) {
      case 0:
        // break;
        _englishKeyboardLayout =
            KeyboardLanguage(englishOtherSpecialCharactersLayout, englishSpecialCharactersLayout, englishDefaultLayout);
        break;
      case 1:
        _germanKeyboardLayout = KeyboardLanguage(germanOtherSpecialCharactersLayout, germanSpecialCharactersLayout, germanDefaultLayout);
        break;
      case 2:
        _spanishKeyboardLayout =
            KeyboardLanguage(spanishOtherSpecialCharactersLayout, spanishSpecialCharactersLayout, spanishDefaultLayout);
        break;
      case 3:
        _frenchKeyboardLayout = KeyboardLanguage(frenchOtherSpecialCharactersLayout, frenchSpecialCharactersLayout, frenchDefaultLayout);
        break;
      case 4:
        _portugueseKeyboardLayout = KeyboardLanguage(portugueseSpecialCharactersLayout, portugueseDefaultLayout, []);
        break;
    }
  }
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

KeyboardLanguage _englishKeyboardLayout =
    KeyboardLanguage(englishDefaultLayout, englishSpecialCharactersLayout, englishOtherSpecialCharactersLayout);
KeyboardLanguage _germanKeyboardLayout =
    KeyboardLanguage(germanDefaultLayout, germanSpecialCharactersLayout, germanOtherSpecialCharactersLayout);
KeyboardLanguage _spanishKeyboardLayout = KeyboardLanguage(spanishDefaultLayout, spanishSpecialCharactersLayout, []);
KeyboardLanguage _frenchKeyboardLayout = KeyboardLanguage(frenchDefaultLayout, frenchSpecialCharactersLayout, []);
KeyboardLanguage _portugueseKeyboardLayout = KeyboardLanguage(portugueseDefaultLayout, portugueseSpecialCharactersLayout, []);
