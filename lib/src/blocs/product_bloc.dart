import 'package:rxdart/rxdart.dart';
import 'package:vendease_test/src/models/product_model.dart';
import 'package:vendease_test/src/models/util_model.dart';
import 'package:vendease_test/src/resources/repository.dart';

class ProductBloc {
  final _repository = Repository();
  final _products = BehaviorSubject<List<ProductModel>?>();
  final _productsDictionary =
      BehaviorSubject<Map<String, List<ProductModel>>?>();
  final _errorResponse = PublishSubject<ErrorResponseModel>();

  // Streams Getter Variables
  Stream<List<ProductModel>?> get products => _products.stream;
  Stream<Map<String, List<ProductModel>>?> get productsDictionary =>
      _productsDictionary.stream;

  getProducts() async {
    HTTPResponseModel resp = await _repository.getProducts();

    bool isSuccess = isApiCallSuccess(resp);
    if (isSuccess) {
      var data = resp.data;
      List<ProductModel> products = List<ProductModel>.from(
          data.map((item) => ProductModel.fromJson(item)));

      Map<String, List<ProductModel>>? productsDictionary = {};

      // For all products tab
      productsDictionary['All Products'] = products.toList();

      /* Categorize products by subCategory in a Dictionary
      * [key] => subCategory
      * [value] => products that belong to subCategory
      */
      for (var product in products) {
        if (productsDictionary
            .containsKey(product.categoryDetails!.subCategory!)) {
          // append data if subCategory key already exists
          productsDictionary[product.categoryDetails!.subCategory!]
              ?.add(product);
        } else {
          // create new subCategory key if it does not exists
          productsDictionary[product.categoryDetails!.subCategory!] = [product];
        }
      }

      _products.sink.add(products);
      _productsDictionary.sink.add(productsDictionary);
    } else {
      _products.sink.add([]);
    }
  }

  dispose() {
    _errorResponse.close();
    _products.close();
  }

  bool isApiCallSuccess(HTTPResponseModel data) {
    print('data.code:: ${data.code}');
    if (data.code >= 300) {
      _errorResponse.sink.add(
          ErrorResponseModel(status: data.status, error: 'An error occured'));
      return false;
    }
    return true;
  }
}
