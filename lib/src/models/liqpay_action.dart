enum LiqPayAction {
  auth("auth"),
  donate("paydonate"),
  hold("hold"),
  subscribe("subscribe"),
  pay("pay");

  final String value;

  const LiqPayAction(this.value);

  static LiqPayAction? fromValue(String? value) {
    if (value == null) {
      return null;
    }

    for (LiqPayAction entry in LiqPayAction.values) {
      if (entry.value == value) {
        return entry;
      }
    }

    throw ArgumentError.value(value);
  }
}
