import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import 'package:bytebankcontatos/http/interceptors/logging_interceptor.dart';

final http.Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

final String baseUrl = 'http://192.168.122.1:8080/transactions';
