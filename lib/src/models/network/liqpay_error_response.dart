import 'package:liqpay/liqpay.dart';

/// Base LiqPay error response
class LiqPayErrorResponse extends LiqPayResponse {
  final String? errorCode;
  final String? errorDescription;
  LiqPayErrorResponse(result, status, this.errorCode, this.errorDescription)
      : super(result, status);

  @override
  List<Object?> get props => [result, status, errorCode, errorDescription];

  factory LiqPayErrorResponse.fromJson(Map<String, dynamic> json) =>
      LiqPayErrorResponse(
        json['result'] as String,
        json['status'] as String,
        json['err_code'] as String?,
        json['err_description'] as String?,
      );
}

// TODO: Cover full error response
/*
ERROR
{
    "result": "error",
    "action": "auth",
    "status": "failure",
    "err_code": "err_wrong",
    "err_description": "Invalid parameter card_date",
    "version": 3,
    "type": "buy",
    "public_key": "sandbox_i93741880090",
    "liqpay_order_id": "3000a10d-980c-4b0d-992c-500bc89aa9c6",
    "description": "Test",
    "amount": 1.0,
    "currency": "UAH",
    "is_3ds": false,
    "key": "card_date",
    "code": "err_wrong"
}
*/
