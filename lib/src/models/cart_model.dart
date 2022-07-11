import 'package:vendease_test/src/models/product_model.dart';

class CartModel {
  int? orderQuantity;
  ProductModel? product;

  CartModel({this.orderQuantity = 1, this.product});

  CartModel.fromJson(Map<String, dynamic> json) {
    orderQuantity = json['order_quantity'];

    product = json['product'] != null
        ? new ProductModel.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_quantity'] = this.orderQuantity;
    if (this.product != null) {
      data['order_quantity'] = this.product!.toJson();
    }
    return data;
  }

  setOrderQuantity(int value) {
    this.orderQuantity = value;
  }
}
