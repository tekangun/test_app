import '../core/constants/enums/request_method.dart';

class RequestModel {
  String path;
  RequestMethod requestMethod;
  Map<String, String>? body;
  String? scheme;
  String? parameters;

  RequestModel({
    required this.path,
    required this.requestMethod,
    this.body,
    this.scheme,
    this.parameters,
  });
}
