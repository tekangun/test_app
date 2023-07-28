import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/enums/request_method.dart';
import '../../models/request_model.dart';

class ApiService {
  final String _baseApi = 'https://reqres.in';

  Future<http.Response> chooseMethod({
    required RequestModel requestModel,
    int? timeOutSecond,
  }) async {
    try {
      switch (requestModel.requestMethod) {
        case RequestMethod.post:
          var uri = Uri.parse('$_baseApi${requestModel.path}');
          if (timeOutSecond == null) {
            return await http.post(
              uri,
              body: requestModel.body,
            );
          } else {
            return await http
                .post(
                  uri,
                  body: requestModel.body,
                )
                .timeout(Duration(seconds: timeOutSecond));
          }

        case RequestMethod.get:
          var uri = Uri.parse('$_baseApi${requestModel.path}?${requestModel.parameters}');
          return await http.get(
            uri,
          );
        case RequestMethod.put:
          return await http.put(
            Uri.parse('$_baseApi${requestModel.path}'),
            body: jsonEncode(requestModel.body),
          );
        case RequestMethod.delete:
          return await http.delete(
            Uri.parse('$_baseApi${requestModel.path}'),
            body: jsonEncode(requestModel.body),
          );
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Map<String, dynamic>> request({
    required RequestModel requestModel,
    int? timeOutSecond,
  }) async {
    late final http.Response response;

    try {
      response = await chooseMethod(requestModel: requestModel, timeOutSecond: timeOutSecond);
      Map<String, dynamic> data = jsonDecode(response.body);
      var validResponse = response.statusCode == 200 || response.statusCode == 400;
      String? errorMessage = data['error'];

      if (validResponse) {
        return data;
      } else {
        return Future.error(errorMessage ?? data);
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
