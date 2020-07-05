import 'package:dio/dio.dart';

class CustomDio {
  final Dio instance;

  CustomDio(this.instance) {
    instance.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    instance.options.receiveTimeout = 3000;
    instance.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  Future _onRequest(RequestOptions options) async {
    print('REQUEST[${options.method}]=> PATH: ${options.path}');
    return options;
  }

  Future _onResponse(Response response) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.request.path}');
    return response;
  }

  Future _onError(DioError erro) async {
    print("ERROR[${erro.error}] => PATH: ${erro.request.path}");
    return erro.error;
  }
}
