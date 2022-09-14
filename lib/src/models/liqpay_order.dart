import 'package:equatable/equatable.dart';
import 'package:liqpay/src/models/liqpay_action.dart';
import 'package:liqpay/src/models/liqpay_card.dart';
import 'package:liqpay/src/models/liqpay_currency.dart';

class LiqPayOrder extends Equatable {
  final String id;
  final double amount;
  final String description;
  final LiqPayAction action;
  final LiqPayCurrency currency;
  final LiqPayCard card;

  const LiqPayOrder(
    this.id,
    this.amount,
    this.description,
    this.card, {
    this.action = LiqPayAction.pay,
    this.currency = LiqPayCurrency.uah,
  });

  @override
  List<Object?> get props => [id, amount, description, action, currency];

  factory LiqPayOrder.fromJson(Map<String, dynamic> json) => LiqPayOrder(
        json['order_id'] as String,
        json['amount'] as double,
        json['description'] as String,
        LiqPayCard(json['card'] as String, json['card_exp_month'] as String,
            json['card_exp_year'] as String, json['card_cvv'] as String),
        action: LiqPayAction.fromValue(json['action']),
        currency: LiqPayCurrency.fromValue(json['currency']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'order_id': id,
        'amount': amount,
        'description': description,
        'action': action.value,
        'currency': currency.value,
        'card': card.number,
        'card_exp_month': card.expirationMonth,
        'card_exp_year': card.expirationYear,
        'card_cvv': card.cvv
      };
}
