### SUPER EARLY DEVELOPMENT STAGE, USE WITH CAUTION!

# LiqPay

[LiqPay](https://www.liqpay.ua/en) payment service wrapper library to be used on a client or server side dart.

## Features

Package has minimum number of features
- Form LiqPay orders with direct card information
- Form LiqPay order with server callback passed

## Usage

```dart
final liqPay = LiqPay("public_liqpay_key", "private_liqpay_key");
final number = "4242424242424242"
final expirationMonth = "12";
final expirationYear = "99";
final cvv = "000";
final card = LiqPayCard(number, expirationMonth, expirationDate, cvv);
final order = LiqPayOrder(const Uuid().v4(), 1, 'Test', card: card, action: LiqPayAction.pay);

await liqPay.purchase(order);
```

## Additional information

More documentation can be found on [LiqPay Official Website](https://www.liqpay.ua/en/documentation/start)
