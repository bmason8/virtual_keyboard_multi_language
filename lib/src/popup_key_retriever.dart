import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

/// Get additional related symbols for a given keyboard letter
class PopupKeyRetriever {
  PopupKeyRetriever({required this.includeSecondaryKey});

  final bool includeSecondaryKey;

  List<VirtualKeyboardKey> getAdditionalRelatedSymbols(String symbol, VirtualKeyboardKey? secondaryKey) {
    final List<VirtualKeyboardKey> keyList = [];
    // check if the map contains the symbol
    if (symbolsMap.containsKey(symbol)) {
      final result = symbolsMap.entries.firstWhere((element) => element.key == symbol);
      // assign the values to the temporary list (keyList)
      for (VirtualKeyboardKey vk in result.value) {
        keyList.add(vk);
      }
      // add the secondary symbol to the results if 'includeSecondaryKey' is enabled
      if (includeSecondaryKey && !result.value.contains(secondaryKey) && secondaryKey != null) {
        keyList.add(secondaryKey);
      }
      return keyList;
    } else {
      // return an empty list if the map does not contain the symbol
      return [];
    }
  }

  final Map<String, List<VirtualKeyboardKey>> symbolsMap = {
    'a': aSymbols,
    'b': bSymbols,
    'c': cSymbols,
    'ç': specialCSymbols,
    'd': dSymbols,
    'e': eSymbols,
    'f': fSymbols,
    'g': gSymbols,
    'h': hSymbols,
    'i': iSymbols,
    'j': jSymbols,
    'k': kSymbols,
    'l': lSymbols,
    'm': mSymbols,
    'n': nSymbols,
    'ñ': specialNSymbols,
    'o': oSymbols,
    'ö': oUmlotSymbols,
    'p': pSymbols,
    'q': qSymbols,
    'r': rSymbols,
    's': sSymbols,
    't': tSymbols,
    'u': uSymbols,
    'v': vSymbols,
    'w': wSymbols,
    'x': xSymbols,
    'y': ySymbols,
    'z': zSymbols,
  };
}

final List<VirtualKeyboardKey> aSymbols = [
  VirtualKeyboardKey(text: 'ª', capsText: 'ª', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'æ', capsText: 'Æ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'à', capsText: 'À', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'á', capsText: 'Á', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'â', capsText: 'Â', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ä', capsText: 'Ä', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ā', capsText: 'Ā', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'å', capsText: 'Å', keyType: VirtualKeyboardKeyType.String),
];

final List<VirtualKeyboardKey> bSymbols = [];

final List<VirtualKeyboardKey> cSymbols = [
  VirtualKeyboardKey(text: 'ć', capsText: 'Ć', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'č', capsText: 'Č', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ĉ', capsText: 'Ĉ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ċ', capsText: 'Ċ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ç', capsText: 'Ç', keyType: VirtualKeyboardKeyType.String),
];

final List<VirtualKeyboardKey> specialCSymbols = [
  VirtualKeyboardKey(text: 'ć', capsText: 'Ć', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'č', capsText: 'Č', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ĉ', capsText: 'Ĉ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ċ', capsText: 'Ċ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ç', capsText: 'Ç', keyType: VirtualKeyboardKeyType.String),
];

final List<VirtualKeyboardKey> dSymbols = [];

final List<VirtualKeyboardKey> eSymbols = [
  VirtualKeyboardKey(text: 'ë', capsText: 'Ë', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'é', capsText: 'É', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'è', capsText: 'È', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ê', capsText: 'Ê', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ę', capsText: 'Ȩ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ē', capsText: 'Ē', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ė', capsText: 'Ė', keyType: VirtualKeyboardKeyType.String),
];

final List<VirtualKeyboardKey> fSymbols = [];
final List<VirtualKeyboardKey> gSymbols = [];
final List<VirtualKeyboardKey> hSymbols = [];
final List<VirtualKeyboardKey> iSymbols = [
  VirtualKeyboardKey(text: 'į', capsText: 'Į', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ī', capsText: 'Ī', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ï', capsText: 'Ï', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ì', capsText: 'Ì', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'î', capsText: 'Î', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'í', capsText: 'Í', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> jSymbols = [];
final List<VirtualKeyboardKey> kSymbols = [];
final List<VirtualKeyboardKey> lSymbols = [];
final List<VirtualKeyboardKey> mSymbols = [];
final List<VirtualKeyboardKey> nSymbols = [
  VirtualKeyboardKey(text: 'ñ', capsText: 'Ñ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ń', capsText: 'Ń', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ǹ', capsText: 'Ǹ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ň', capsText: 'Ň', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> specialNSymbols = [
  VirtualKeyboardKey(text: 'ñ', capsText: 'Ñ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ń', capsText: 'Ń', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ǹ', capsText: 'Ǹ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ň', capsText: 'Ň', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> oSymbols = [
  VirtualKeyboardKey(text: 'œ', capsText: 'Œ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ø', capsText: 'Ø', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'º', capsText: 'ᴼ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ō', capsText: 'Ō', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ö', capsText: 'Ö', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ò', capsText: 'Ò', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ô', capsText: 'Ô', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'õ', capsText: 'Õ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ó', capsText: 'Ó', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> oUmlotSymbols = [
  VirtualKeyboardKey(text: 'œ', capsText: 'Œ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ø', capsText: 'Ø', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'º', capsText: 'ᴼ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ō', capsText: 'Ō', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ö', capsText: 'Ö', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ò', capsText: 'Ò', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ô', capsText: 'Ô', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'õ', capsText: 'Õ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ó', capsText: 'Ó', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> pSymbols = [];
final List<VirtualKeyboardKey> qSymbols = [];
final List<VirtualKeyboardKey> rSymbols = [];
final List<VirtualKeyboardKey> sSymbols = [
  VirtualKeyboardKey(text: 'ŝ', capsText: 'Ŝ', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'š', capsText: 'Š', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ś', capsText: 'Ś', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ß', capsText: 'ß', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> tSymbols = [];
final List<VirtualKeyboardKey> uSymbols = [
  VirtualKeyboardKey(text: 'ū', capsText: 'Ū', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ù', capsText: 'Ù', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ú', capsText: 'Ú', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'û', capsText: 'Û', keyType: VirtualKeyboardKeyType.String),
  VirtualKeyboardKey(text: 'ü', capsText: 'Ü', keyType: VirtualKeyboardKeyType.String),
];
final List<VirtualKeyboardKey> vSymbols = [];
final List<VirtualKeyboardKey> wSymbols = [];
final List<VirtualKeyboardKey> xSymbols = [];
final List<VirtualKeyboardKey> ySymbols = [];
final List<VirtualKeyboardKey> zSymbols = [];
