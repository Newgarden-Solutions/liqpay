import 'package:liqpay/liqpay.dart';

/// Base LiqPay success response class
class LiqPaySuccessResponse extends LiqPayResponse {
  LiqPaySuccessResponse(result, status) : super(result, status);

  @override
  List<Object?> get props => [result, status];

  factory LiqPaySuccessResponse.fromJson(Map<String, dynamic> json) =>
      LiqPaySuccessResponse(
        json['result'] as String,
        json['status'] as String,
      );
}

// TODO: Cover full success response
/* 
SUCCESS
{
    "result": "ok",
    "payment_id": 2087459392,
    "action": "auth",
    "status": "success",
    "version": 3,
    "type": "buy",
    "paytype": "card",
    "public_key": "sandbox_i93741880090",
    "acq_id": 414963,
    "order_id": "bb1ed039-959c-4e23-8b6b-9f6ed942fcf1",
    "liqpay_order_id": "KLNVFGNR1663678034150723",
    "description": "Test",
    "sender_card_mask2": "424242*42",
    "sender_card_bank": "Test",
    "sender_card_type": "visa",
    "sender_card_country": 804,
    "amount": 1.0,
    "currency": "UAH",
    "sender_commission": 0.0,
    "receiver_commission": 0.0,
    "agent_commission": 0.0,
    "amount_debit": 1.0,
    "amount_credit": 1.0,
    "commission_debit": 0.0,
    "commission_credit": 0.0,
    "currency_debit": "UAH",
    "currency_credit": "UAH",
    "sender_bonus": 0.0,
    "amount_bonus": 0.0,
    "mpi_eci": "7",
    "is_3ds": false,
    "create_date": 1663678034151,
    "end_date": 1663678034167,
    "transaction_id": 2087459392
}
 */
