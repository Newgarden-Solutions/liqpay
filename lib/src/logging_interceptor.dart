import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    print('----- REQUEST -----');
    print(request.toString());
    print('HEADERS 👇\n\n${request.headers.toString()}');
    if (request is Request) {
      print('BODY 👇\n\n${(request).body}');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('----- RESPONSE -----');
    print('STATUS CODE: ${response.statusCode}');
    print('HEADERS 👇 \n\n${response.headers.toString()}');
    if (response is Response) {
      print('BODY 👇 \n\n${(response).body}');
    }
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async => true;

  @override
  Future<bool> shouldInterceptResponse() async => true;
}
