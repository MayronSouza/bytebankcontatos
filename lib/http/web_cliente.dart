import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Reques');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Reques');
    print('headers: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

void findAll() async {
  final http.Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  final http.Response res =
      await client.get('http://192.168.122.1:8080/transactions');
  print(res.body);
}
