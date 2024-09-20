//
import 'package:dio/dio.dart';

abstract class IRESTClient {
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Object data,
  });

  Future<Map<String, dynamic>> get({
    required String endpoint,
  });
}

class DIORESTClient implements IRESTClient {
  //
  final Dio dio = Dio();

  DIORESTClient() {
    dio.options.baseUrl = "http://localhost:3000";
  }

  @override
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Object data,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> get({
    required String endpoint,
  }) async {
    try {
      final response = await dio.get(endpoint);
      if (response.data is Map) {
        return response.data;
      } else {
        return {
          "data": response.data,
        };
      }
    } catch (e) {
      rethrow;
    }
  }

  //
}
