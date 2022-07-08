class HTTPResponseModel {
  HTTPResponseModel();

  bool? _status;
  int? _code;
  String? _message;
  dynamic _error;
  dynamic _data;

  bool get status => _status!;
  int get code => _code!;
  String get message => _message!;
  dynamic get error => _error!;
  dynamic get data => _data!;

  set setStatus(bool status) => _status = status;
  set setSuccess(int code) => _code = code;
  set setErrorMessage(String message) => _message = message;
  set setError(error) => _error = error;
  set setData(data) => _data = data;

  HTTPResponseModel.jsonToMap(Map<dynamic, dynamic> parsedJson, [topic]) {
    print('parsedJson:: $parsedJson');
    _status = parsedJson['status'] ?? parsedJson['success'] ?? false;
    _code = parsedJson['code'] ?? ((_status ?? false) ? 200 : 400);
    _message = parsedJson['message'];
    _error = parsedJson['error'];
    _data = parsedJson['data'];
  }
}

class ErrorResponseModel {
  ErrorResponseModel(
      {this.status = false, this.code = 400, required this.error});
  final bool status;
  final int code;
  final String error;
}
