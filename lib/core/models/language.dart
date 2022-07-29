abstract class Language {
// Map have a string and a list that contains all supported translations for given string
  /*
  ** Languages indices
    [0] => English
    [1] =>  Arabic
  **
  */
  static final Map<String, List<String>> languages = {
    "Explore": ["Explore", "إكتشف"],
    "Al-Ahsa": ["Al-Ahsa", "الأحساء"],
    "Place": ["Place", "مكان"],
    "Explore Destinition": ["Explore Destinition", "أكتشف الوجهات"],
    "All": ["All", "الكل"],
    "Restaurant": ["Restaurant", "مطعم"],
    "Park": ["Park", "حديقة"],
    "Cafe": ["Cafe", "كافيه"],
    "Historical": ["Historical", "تاريخي"],
    "Shop": ["Shop", "سوق"]
  };
}
