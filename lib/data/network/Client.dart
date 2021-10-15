import "package:dio/dio.dart";
import 'package:chatapp/config/ApiConfig.dart';
import 'package:chatapp/data/DataManager.dart';
import 'package:chatapp/di/locator.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Client {
  String BASEURL = ApiConfig.BASE_URL;
  String APIKEY = ApiConfig.API_KEY;
  Dio? _dio;
  BaseOptions options = new BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 5000,
  );

  String? token;
  Map<String, Object>? header;

  Client({this.token});

  Client builder() {
    header = Map<String, Object>();
    header!.putIfAbsent('Accept', () => 'application/json');
    header!.putIfAbsent('x-api-key', () => APIKEY);
    header!.putIfAbsent('Content-Type', () => 'application/json');
    _dio = new Dio(options);
    _dio!.interceptors.add(hy);
    _dio!.interceptors.add(PrettyDioLogger());
    _dio!.options.baseUrl = BASEURL;
    _dio!.options.headers = header;
    return this;
  }

  Client acceptHtml() {
    header!.remove('Accept');
    return this;
  }

  Client setUrlEncoded() {
    header!.remove('Content-Type');
    header!
        .putIfAbsent('Content-Type', () => 'application/x-www-form-urlencoded');
    _dio!.options.headers = header;
    return this;
  }

  Client removeContentType() {
    header!.remove('Content-Type');
    return this;
  }

  Client removeAndAddAccept() {
    header!.remove('Accept');
    header!.putIfAbsent("Accept", () => "*/*");
    return this;
  }

  Client setMultipartFormDataHeader() {
    header!.remove('Content-Type');
    header!.putIfAbsent('Content-Type', () => 'multipart/form-data');
    _dio!.options.headers = header;
    return this;
  }

  Future<Client> setProtectedApiHeader() async {
    DataManager _dataManager = locator<DataManager>();
    // String? token = await _dataManager.getServerAuthToken();
    //get token from sharedprefrence
    header!.putIfAbsent('Authorization', () => 'Bearer $token');
    return this;
  }

  Dio build() {
    return _dio!;
  }
}

InterceptorsWrapper hy = InterceptorsWrapper(
  onRequest: (options, handler) {
    return handler.next(options);
  },
  onResponse: (response, handler) {
    return handler.next(response);
  },
  onError: (DioError e, handler) {
    return handler.next(e);
  },
);
