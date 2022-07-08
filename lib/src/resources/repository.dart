import 'dart:async';
import 'package:vendease_test/src/resources/api_provider.dart';

import '../models/util_model.dart';

class Repository {
  final int _api = 0;
  List<Source> sources = <Source>[ApiProvider()];

  Future<HTTPResponseModel> products() async {
    return await sources[_api].products();
  }
}

abstract class Source {
  Future<HTTPResponseModel> products();
}

isApiCallSuccess(HTTPResponseModel data) {
  if (data.code >= 300 && !data.status) {
    return false;
  }
  return true;
}
