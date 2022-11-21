import 'package:equatable/equatable.dart';
import 'package:liqpay/src/models/liqpay_action.dart';
import 'package:liqpay/src/models/liqpay_card.dart';
import 'package:liqpay/src/models/liqpay_currency.dart';
import 'package:liqpay/src/models/liqpay_language.dart';

class LiqPayOrder extends Equatable {
  final String id;
  final double amount;
  final String description;
  final LiqPayAction action;
  final LiqPayCurrency currency;
  final LiqPayCard? card;
  final LiqPayLanguage? language;
  final String? serverUrl;

  const LiqPayOrder(this.id, this.amount, this.description,
      {this.card,
      this.serverUrl,
      this.action = LiqPayAction.pay,
      this.currency = LiqPayCurrency.uah,
      this.language = LiqPayLanguage.uk});

  @override
  List<Object?> get props =>
      [id, amount, description, action, currency, card, language];

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
        action: LiqPayAction.fromValue(json['action']),
        currency: LiqPayCurrency.fromValue(json['currency']),
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'order_id': id,
      'amount': amount,
      'description': description,
      'action': action.value,
      'currency': currency.value,
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
