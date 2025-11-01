### SUPER EARLY DEVELOPMENT STAGE, USE WITH CAUTION!

# LiqPay

[![pub package](https://img.shields.io/pub/v/liqpay.svg)](https://pub.dev/packages/liqpay)

[LiqPay](https://www.liqpay.ua/en) payment service wrapper library to be used on a client or server side dart.

## Features

Package has minimum number of features
- Form LiqPay orders with direct card information
- Form LiqPay orders with server callback passed

## Usage

### 1. Direct payment with card

```dart
final liqPay = LiqPay("public_liqpay_key", "private_liqpay_key");
final number = "4242424242424242";
final expirationMonth = "12";
final expirationYear = "99";
final cvv = "000";
final card = LiqPayCard(number, expirationMonth, expirationDate, cvv);
final order = LiqPayOrder(const Uuid().v4(), 1, 'Order description', card: card);

await liqPay.purchase(order);
```

### 2. Open checkout URL

Payment can also be done with checkout URL opening in internal browser. In such case you should specify a callback URL to receive POST message from LiqPay with the results of the transaction.

```dart
final liqPay = LiqPay("public_liqpay_key", "private_liqpay_key");

// Server URL to receive POST message with result from LiqPay
final serverUrl = "my_server_url";
final order = LiqPayOrder(const Uuid().v4(), 100, 'Order description', serverUrl: serverUrl),

final url = await liqPay.checkout(order);

// Open url in web view
```

More info at [LiqPay Checkout](https://www.liqpay.ua/doc/api/internet_acquiring/checkout)

## Additional information

More documentation can be found on [LiqPay Official Website](https://www.liqpay.ua/en/documentation/start)
