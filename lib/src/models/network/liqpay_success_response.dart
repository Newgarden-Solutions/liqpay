import 'package:liqpay/liqpay.dart';

/// Base LiqPay success response class
// TODO: https://github.com/Newgarden-Solutions/liqpay/issues/2
class LiqPaySuccessResponse extends LiqPayResponse {
  LiqPaySuccessResponse(
      super.result, super.status, super.version, super.action);

  factory LiqPaySuccessResponse.fromJson(Map<String, dynamic> json) =>
      LiqPaySuccessResponse(
        json['result'] as String,
        json['status'] as String,
        json['version'] as String,
        LiqPayAction.fromValue(json['action']),
      );
}
