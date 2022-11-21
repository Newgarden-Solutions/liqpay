import 'package:equatable/equatable.dart';
import 'package:liqpay/src/models/network/liqpay_error_response.dart';
import 'package:liqpay/src/models/network/liqpay_success_response.dart';

/// Base LiqPay response class
class LiqPayResponse extends Equatable {
  final String result;
  final String status;

  const LiqPayResponse(this.result, this.status);

  @override
  List<Object?> get props => [result, status];

  factory LiqPayResponse.success(Map<String, dynamic> json) =>
      LiqPaySuccessResponse.fromJson(json);
  factory LiqPayResponse.error(Map<String, dynamic> json) =>
      LiqPayErrorResponse.fromJson(json);
}
