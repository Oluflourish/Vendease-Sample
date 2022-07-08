import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vendease_test/src/models/util_model.dart';
import 'dart:io';
import 'package:vendease_test/src/resources/repository.dart';

enum RequestType { POST, GET }

const int httpTimeoutDuration = 45;

class ApiProvider implements Source {
  String? _root = "";

  Map<String, String> getHeader({String? token}) {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: token != null ? 'Bearer $token' : '',
    };
  }

  ApiProvider() {
    _root = 'https://live-vendease.herokuapp.com/';
  }

  // get product endpoint
  final String _product =
      "product?\$limit=50&&name[\$search]=co&\$skip=0&cityCode=LA724629&countryCode=NI904222";

  Map<dynamic, dynamic> exceptionHandler(
      Object exception, StackTrace stacktrace) {
    // switch (exception.runtimeType) {
    //   case TimeoutException:
    //     return AppConstants.timeOutJson;
    //   case SocketException:
    //     return AppConstants.socketIOJson;
    //   default:
    //     return AppConstants.unknownExceptionJson;
    // }

    return {};
  }

  Future<HTTPResponseModel> httpBaseRequest({
    Map? body,
    required String url,
    required Map<String, String> headers,
    required RequestType requestType,
    timeout = httpTimeoutDuration,
  }) async {
    Client client = http.Client();
    http.Response response;
    dynamic result;

    try {
      switch (requestType) {
        case RequestType.POST:
          response = await client
              .post(Uri.parse('$_root$url'),
                  headers: headers, body: json.encode(body))
              .timeout(Duration(seconds: timeout));

          break;
        case RequestType.GET:
          response = await client
              .get(Uri.parse('$_root$url'), headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        default:
          response = await client
              .get(Uri.parse('$_root$url'), headers: headers)
              .timeout(Duration(seconds: timeout));
      }

      result = json.decode(response.body);
    } catch (exception, stackTrace) {
      result =
          json.decode(json.encode(exceptionHandler(exception, stackTrace)));
    } finally {
      client.close();
    }

    return HTTPResponseModel.jsonToMap(result);
  }

  Future<HTTPResponseModel> products() async {
    return await httpBaseRequest(
      url: _product,
      requestType: RequestType.GET,
      headers: getHeader(),
    );
  }
}
