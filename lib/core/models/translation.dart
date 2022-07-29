enum Languages {
  english,
  arabic,
}

/* Convert a word from a language to another language
  @param translatedWord is the original word
  @param language is the target language to translate to
  @return translaetd word
  @throw Word is not found if the translatedWord wasn't found in _translate
*/
String translateToAnotherLanguage(String translatedWord, Languages language) {
  for (var element in _dictionary.values) {
    if (element.contains(translatedWord)) {
      return element[language.index];
    }
  }
  throw "Word is not found";
}

String translateEnglishToAnotherLanguage(String word, Languages language) =>
    _dictionary[word]![language.index];

String translateToEnglish(String word) =>
    translateToAnotherLanguage(word, Languages.english);

// Map have a string and a list that contains all supported translations for given string
/*
  ** Languages indices
    [0] => English
    [1] =>  Arabic
  **
  */

Map<String, List<String>> _dictionary = {
  "Explore": [
    "Explore",
    "إكتشف",
  ],
  "Al-Ahsa": [
    "Al-Ahsa",
    "الأحساء",
  ],
  "Place": [
    "Place",
    "مكان",
  ],
  "Explore Destinition": [
    "Explore Destinition",
    "أكتشف الوجهات",
  ],
  "All": [
    "All",
    "الكل",
  ],
  "Restaurant": [
    "Restaurant",
    "مطعم",
  ],
  "Park": [
    "Park",
    "حديقة",
  ],
  "Cafe": [
    "Cafe",
    "كافيه",
  ],
  "Historical": [
    "Historical",
    "تاريخي",
  ],
  "Shop": [
    "Shop",
    "سوق",
  ],
  "Favorites": [
    "Favorites",
    "المفضلة",
  ],
  "Add your favorite places to display it here": [
    "Add your favorite places to display it here",
    "اضف اماكنك المفضلة لعرضها هنا",
  ],
  "Price": [
    "Price",
    "السعر",
  ],
  "SAR": [
    "SAR",
    "ريال",
  ],
  "Go Now!": [
    "Go Now!",
    "!اذهب الأن",
  ],
  "No place to display": [
    "No place to display",
    "لا يوجد مكان لعرضه",
  ],
  "Settings": [
    "Settings",
    "الإعدادات",
  ],
  "Language": [
    "Language",
    "اللغة",
  ],
};
