
import 'package:dio/dio.dart';

class RequestInterceptors extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options) async {
    // TODO: implement onRequest
    options.headers['Accepts'] = 'application/json';
    print("拦截：请求baseUrl：${options.baseUrl}");
    print("拦截：请求url：${options.path}");
    print('拦截：请求头: ' + options.headers.toString());
    if (options.data != null) {
      print('拦截：请求参数: ' + options.data.toString());
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    if (response != null) {
      var responseStr = response.toString();
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    print('请求异常: ' + err.toString());
    print('请求异常信息: ' + err.response?.toString() ?? "");
    return super.onError(err);
  }
}