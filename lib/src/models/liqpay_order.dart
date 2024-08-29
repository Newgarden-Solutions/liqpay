import 'package:liqpay/src/models/liqpay_action.dart';
import 'package:liqpay/src/models/liqpay_card.dart';
import 'package:liqpay/src/models/liqpay_currency.dart';
import 'package:liqpay/src/models/liqpay_language.dart';

class LiqPayOrder {
  /// Unique purchase identifier in your shop.
  /// Maximum length is `255` symbols.
  final String id;

  /// Payment amount. For example: 5, 7.34
  final double amount;

  /// Payment description.
  final String description;

  /// Payment action
  final LiqPayAction? action;

  /// Payment currency
  final LiqPayCurrency? currency;

  /// Card details (number, cvv etc.)
  final LiqPayCard? card;

  /// Customer's language.
  final LiqPayLanguage? language;

  /// URL API for notifications of payment status change (server -> server).
  /// Maximum length is `510` symbols.
  /// More details here: https://www.liqpay.ua/en/documentation/api/callback
  final String? serverUrl;

  const LiqPayOrder(this.id, this.amount, this.description,
      {this.card,
      this.serverUrl,
      this.action = LiqPayAction.pay,
      this.currency = LiqPayCurrency.uah,
      this.language = LiqPayLanguage.uk});

  factory LiqPayOrder.fromJson(Map<String, dynamic> json) => LiqPayOrder(
        json['order_id'] as String,
        json['amount'] as double,
        json['description'] as String,
        serverUrl: json['server_url'],
        card: LiqPayCard(
            json['card'] as String,
            json['card_exp_month'] as String,
            json['card_exp_year'] as String,
            json['card_cvv'] as String),
        action: LiqPayAction.fromValue(json['action'] as String?),
        currency: LiqPayCurrency.fromValue(json['currency'] as String?),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'order_id': id,
      'amount': amount,
      'description': description,
      'action': action?.value,
      'currency': currency?.value,
    };

    if (card != null) {
      json['card'] = card?.number;
      json['card_exp_month'] = card?.expirationMonth;
      json['card_exp_year'] = card?.expirationYear;
      json['card_cvv'] = card?.cvv;
    }

    if (serverUrl != null) {
      json['server_url'] = serverUrl;
    }

    return json;
  }
}
