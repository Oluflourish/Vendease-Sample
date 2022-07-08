import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:vendease_test/src/models/util_model.dart';
import 'dart:io';
import 'package:vendease_test/src/resources/repository.dart';

enum RequestType { POST, GET }

const int httpTimeoutDuration = 45;

class ApiProvider implements Source {
  String? _baseUrl = 'https://live-vendease.herokuapp.com/';

  Map<String, String> getHeader({String? token}) {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  // get product endpoint
  final String _product =
      "product?\$limit=50&&name[\$search]=co&\$skip=0&cityCode=LA724629&countryCode=NI904222";

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
              .post(Uri.parse('$_baseUrl$url'),
                  headers: headers, body: json.encode(body))
              .timeout(Duration(seconds: timeout));

          break;
        case RequestType.GET:
          response = await client
              .get(Uri.parse('$_baseUrl$url'), headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        default:
          response = await client
              .get(Uri.parse('$_baseUrl$url'), headers: headers)
              .timeout(Duration(seconds: timeout));
      }

      result = json.decode(response.body);
    } finally {
      client.close();
    }

    return HTTPResponseModel.jsonToMap(response.statusCode, result);
  }

  Future<HTTPResponseModel> getProducts() async {
    return await httpBaseRequest(
      url: _product,
      requestType: RequestType.GET,
      headers: getHeader(),
    );
  }
}
