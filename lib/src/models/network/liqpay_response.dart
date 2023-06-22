import 'package:liqpay/liqpay.dart';

/// Base LiqPay response class
class LiqPayResponse {
  /// Result of the response.
  ///
  /// `ok` in case of success
  /// `error` in case of failure
  final String result;

  /// Status of the result.
  ///
  /// `success` in case of success
  /// `failure` in case of error
  final String status;

  /// Numeric API version (e.g. "3") returned as string.
  final String version;

  /// Action used in request that resulted in this response.
  final LiqPayAction action;

  const LiqPayResponse(this.result, this.status, this.version, this.action);

  factory LiqPayResponse.success(Map<String, dynamic> json) =>
      LiqPaySuccessResponse.fromJson(json);
  factory LiqPayResponse.error(Map<String, dynamic> json) =>
      LiqPayErrorResponse.fromJson(json);
}
