import 'package:liqpay/liqpay.dart';

/// Base LiqPay success response class
class LiqPaySuccessResponse extends LiqPayResponse {
  LiqPaySuccessResponse(
    super.result,
    super.status, {
    super.version,
    super.action,
    super.orderId,
    super.liqPayOrderId,
    super.publicKey,
    super.is3ds,
    super.amount,
    super.description,
    super.currency,
    super.language,
  });

  factory LiqPaySuccessResponse.fromJson(Map<String, dynamic> json) {
    final common = LiqPayResponse.parseCommon(json);

    return LiqPaySuccessResponse(
      json['result'] as String,
      json['status'] as String,
      version: common.version,
      action: common.action,
      orderId: common.orderId,
      liqPayOrderId: common.liqPayOrderId,
      publicKey: common.publicKey,
      is3ds: common.is3ds,
      amount: common.amount,
      description: common.description,
      currency: common.currency,
      language: common.language,
    );
  }
}
