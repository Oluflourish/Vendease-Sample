class HTTPResponseModel {
  bool? _status;
  int? _code;
  dynamic _data;

  int get code => _code!;
  dynamic get status => _status!;
  dynamic get data => _data!;

  set setStatus(bool status) => _status = status;
  set setSuccess(int code) => _code = code;
  set setData(data) => _data = data;

  HTTPResponseModel.jsonToMap(
      int statusCode, Map<dynamic, dynamic> parsedJson) {
    print('parsedJson:: $parsedJson');
    _status = statusCode >= 300 ? false : true;
    _code = statusCode;
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
