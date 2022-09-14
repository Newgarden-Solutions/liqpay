enum LiqPayCurrency {
  uah("UAH"),
  usd("USD"),
  eur("EUR");

  final String value;

  const LiqPayCurrency(this.value);

  static LiqPayCurrency fromValue(String value) {
    for (LiqPayCurrency entry in LiqPayCurrency.values) {
      if (entry.value == value) {
        return entry;
      }
    }

    throw ArgumentError.value(value);
  }
}
