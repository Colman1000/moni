import 'package:http/http.dart';

class MockRequest {
  MockRequest(this.result);

  final Response result;

  Future<Response> request(Uri url, {Map<String, String>? headers}) async =>
      result;
}
