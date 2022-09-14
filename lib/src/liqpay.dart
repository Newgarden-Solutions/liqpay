import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:liqpay/src/constants.dart';
import 'package:liqpay/src/logging_interceptor.dart';
import 'package:liqpay/src/models/liqpay_order.dart';

class LiqPay {
  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final String privateKey;
  final String publicKey;

  LiqPay(this.publicKey, this.privateKey);

  /// Perform a purchase
  Future<String> purchase(LiqPayOrder order) async {
    final url = Uri.https(kHost, kApiEndpoint);

    final jsonObject = order.toJson();
    jsonObject['public_key'] = publicKey;
    jsonObject['version'] = kApiVersion.toString();

    final jsonString = json.encode(jsonObject);
    log("Json: $jsonString");

    final data = base64.encode(utf8.encode(jsonString));
    log("Data: $data");

    final signature = _createSignature(data);
    log("Signature: $signature");

    final response =
        await client.post(url, body: {"data": data, "signature": signature});

    log("Response: $response");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  String _createSignature(String data) {
    final signatureString = privateKey + data + privateKey;
    return base64.encode(sha1.convert(utf8.encode(signatureString)).bytes);
  }
}
