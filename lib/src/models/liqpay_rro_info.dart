import 'package:liqpay/src/models/liqpay_item.dart';

class LiqPayRroInfo {
  final List<LiqPayItem> items;
  final List<String> deliveryEmails;

  LiqPayRroInfo({required this.items, required this.deliveryEmails});

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'delivery_emails': deliveryEmails,
    };
  }

  factory LiqPayRroInfo.fromJson(Map<String, dynamic> json) {
    return LiqPayRroInfo(
      items: (json['items'] as List)
          .map((item) => LiqPayItem.fromJson(item))
          .toList(),
      deliveryEmails: (json['delivery_emails'] as List)
          .map((e) => e as String)
          .toList(),
    );
  }
}
