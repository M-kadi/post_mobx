import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
// https://my-json-server.typicode.com/SharminSirajudeen/test_resources/users
// https://my-json-server.typicode.com/SharminSirajudeen/test_resources/posts
  static var baseURL = 'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/';


  static Dio create({otherBaseURL}) {
    final BaseOptions baseOptions = BaseOptions(
        baseUrl: otherBaseURL ?? baseURL,
        // receiveDataWhenStatusError: true,
        // connectTimeout: 10000, //60*1000, // 60 seconds //10000
        // receiveTimeout: 10000, //60*1000 // 60 seconds  //10000

      // connectTimeout: 30000,
      // responseType: ResponseType.json,
      // contentType: ContentType.json.toString(),
    );

    final dio = Dio(baseOptions);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 180,
    ));

    return dio;
  }
}