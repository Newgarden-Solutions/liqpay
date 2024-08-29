import 'package:liqpay/liqpay.dart';

/// Base LiqPay error response
class LiqPayErrorResponse extends LiqPayResponse {
  final String? errorCode;
  final String? errorDescription;

  LiqPayErrorResponse(
      super.result, super.status, this.errorCode, this.errorDescription,
      {super.version,
      super.action,
      super.orderId,
      super.liqPayOrderId,
      super.publicKey,
      super.is3ds,
      super.amount,
      super.description,
      super.currency,
      super.language});

  factory LiqPayErrorResponse.fromJson(Map<String, dynamic> json) {
    final common = LiqPayResponse.parseCommon(json);

    return LiqPayErrorResponse(
      json['result'] as String,
      json['status'] as String,
      json['err_code'] as String?,
      json['err_description'] as String?,
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
