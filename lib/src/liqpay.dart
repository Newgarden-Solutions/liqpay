import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:liqpay/src/constants.dart';
import 'package:liqpay/src/logging_interceptor.dart';
import 'package:liqpay/src/models/liqpay_order.dart';
import 'package:liqpay/src/models/network/liqpay_response.dart';

class LiqPay {
  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  final String privateKey;
  final String publicKey;

  LiqPay(this.publicKey, this.privateKey);

  /// Perform a purchase
  Future<LiqPayResponse> purchase(LiqPayOrder order) async {
    final url = Uri.https(kHost, kServerApiEndpoint);

    final response = await client.post(url, body: _getRequestData(order));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data["status"] == "success") {
        return LiqPayResponse.success(data);
      } else {
        return LiqPayResponse.error(data);
      }
    } else {
      throw HttpException(response.toString(), uri: url);
    }
  }

  /// Performs checkout request to LiqPay with [order]
  /// This will actually return redirect url location.
  Future<String> checkout(LiqPayOrder order) async {
    final url = Uri.https(kHost, kClientApiEndpoint, _getRequestData(order));
    final response = await client.post(url);
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 302) {
      final location =
          response.headers["location"] ??
          (throw HttpException(response.toString(), uri: url));
      log("Redirect location: $location");
      return location;
    } else {
      throw HttpException(response.toString(), uri: url);
    }
  }

  /// Returns request data and signature from the [order] object.
  /// Resulting map will contain values within "data" and "signature" keys.
  Map<String, String> _getRequestData(LiqPayOrder order) {
    final jsonObject = order.toJson();
    jsonObject['public_key'] = publicKey;
    jsonObject['version'] = kApiVersion.toString();

    final jsonString = json.encode(jsonObject);
    log("Request json: $jsonString");

    final data = base64.encode(utf8.encode(jsonString));
    final signature = _createSignature(data);

    return {"data": data, "signature": signature};
  }

  /// Creates signature for the [data] string.
  String _createSignature(String data) {
    final signatureString = privateKey + data + privateKey;
    return base64.encode(sha1.convert(utf8.encode(signatureString)).bytes);
  }
}
