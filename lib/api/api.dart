import 'package:dio/dio.dart';
import 'package:flutter_starter_app/config/app_config.dart';
import 'endpoints.dart';


class API {
  final Dio dio;
  final String host;



  API(this.host) : dio = Dio()
  {

    dio.interceptors
      ..add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {


          String token = AppConfig().apiKey;
          options.headers["authorization"] = "Bearer " +  token;



        return handler.next(options);
      }, onError: (DioError err, ErrorInterceptorHandler handler) async {


        return handler.next(err);
      }, onResponse:
          (Response response, ResponseInterceptorHandler handler) async {


        return handler.next(response);
      }));
  }

  Uri endpointUri(Endpoint endpoint) => Uri(
    scheme: 'https',
    host: host,
    path: EndpointPaths.getEndpointPath(endpoint),
  );
}
