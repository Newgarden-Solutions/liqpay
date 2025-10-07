import 'dart:io';

import 'package:liqpay/liqpay.dart';
import 'package:liqpay/src/constants.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'liqpay_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('LiqPay.purchase', () {
    final mockClient = MockClient();
    final liqPay = LiqPay('publicKey', 'privateKey')..client = mockClient;
    final order = LiqPayOrder("orderId", 1, "description");
    final url = Uri.https(kHost, kServerApiEndpoint);

    test(
      'returns LiqPaySuccessResponse when status code 200 and the call completes successfully',
      () async {
        final kSuccessResponse = http.Response(
          '{"result": "ok","status": "success","version": "$kApiVersion","action": "${LiqPayAction.pay.value}"}',
          200,
        );

        when(
          mockClient.post(url, body: anyNamed('body')),
        ).thenAnswer((_) async => kSuccessResponse);

        final result = await liqPay.purchase(order);
        expect(result, isA<LiqPaySuccessResponse>());
        expect(result.result, "ok");
        expect(result.status, "success");
        expect(result.action, LiqPayAction.pay);
        expect(result.version, "$kApiVersion");
      },
    );

    test(
      'returns LiqPayErrorResponse when status code 200 but the call completes with an error',
      () async {
        final kErrorResponse = http.Response(
          '{"result": "error","status": "failure","version": "$kApiVersion","action": "${LiqPayAction.pay.value}"}',
          200,
        );

        when(
          mockClient.post(url, body: anyNamed('body')),
        ).thenAnswer((_) async => kErrorResponse);

        final result = await liqPay.purchase(order);
        expect(result, isA<LiqPayErrorResponse>());
        expect(result.result, "error");
        expect(result.status, "failure");
        expect(result.action, LiqPayAction.pay);
        expect(result.version, "$kApiVersion");
      },
    );

    test('throws HttpException when status code not 200', () async {
      final response = http.Response("", 400);
      when(
        mockClient.post(url, body: anyNamed('body')),
      ).thenAnswer((_) async => response);

      expect(
        liqPay.purchase(order),
        throwsA(
          predicate(
            (e) =>
                e is HttpException &&
                e.uri == url &&
                e.message == response.toString(),
          ),
        ),
      );
    });
  });
}
