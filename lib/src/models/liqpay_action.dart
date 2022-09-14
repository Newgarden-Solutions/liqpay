enum LiqPayAction {
  // TODO: Add other actions: hold, subscribe
  auth("auth"),
  donate("paydonate"),
  pay("pay");

  final String value;

  const LiqPayAction(this.value);

  static LiqPayAction fromValue(String value) {
    for (LiqPayAction entry in LiqPayAction.values) {
      if (entry.value == value) {
        return entry;
      }
    }

    throw ArgumentError.value(value);
  }
}
