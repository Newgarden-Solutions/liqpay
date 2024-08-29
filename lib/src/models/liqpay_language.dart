enum LiqPayLanguage {
  uk("uk"),
  en("en");

  final String value;

  const LiqPayLanguage(this.value);

  static LiqPayLanguage? fromValue(String? value) {
    if (value == null) {
      return null;
    }

    for (LiqPayLanguage entry in LiqPayLanguage.values) {
      if (entry.value == value) {
        return entry;
      }
    }

    throw ArgumentError.value(value);
  }
}
