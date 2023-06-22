/// Represents card details used in LiqPay order.
class LiqPayCard {
  /// Card number of the payer
  final String number;

  /// Expiry month of the payer's card. For example: `08`.
  /// This parameter is required if the card number or an unencrypted token is being passed
  final String expirationMonth;

  /// Expiry year of the payer's card. For example: `19`.
  /// This parameter is required if the card number or an unencrypted token is being passed
  final String expirationYear;

  /// CVV/CVV2.
  /// The parameter is required if the card number is being passed
  final String cvv;

  LiqPayCard(this.number, this.expirationMonth, this.expirationYear, this.cvv);
}
