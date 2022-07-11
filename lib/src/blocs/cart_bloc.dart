import 'package:rxdart/rxdart.dart';
import 'package:vendease_test/src/models/cart_model.dart';

class CartBloc {
  // final _cartItems = BehaviorSubject<List<CartModel>?>.seeded([]);
  final _cartItems = BehaviorSubject<List<CartModel>?>();
  final _cartTotal = BehaviorSubject<num?>();
  Stream<List<CartModel>?> get cartItems => _cartItems.stream;
  Stream<num?> get cartTotal => _cartTotal.stream;

  init() {
    if (!_cartItems.hasValue) _cartItems.sink.add([]);
  }

  addItemtoCart(CartModel cartItem) async {
    if (!_cartItems.hasValue) _cartItems.sink.add([]);
    List<CartModel> cartItemsList = _cartItems.value!;
    cartItemsList.add(cartItem);
    _cartItems.sink.add(cartItemsList);
    getCartTotal();
  }

  increaseCartItemQuantity(int index) async {
    int orderQuantity =
        _cartItems.value![index].orderQuantity! + 1; // Increment Quantity
    setCartItemQuantity(index, orderQuantity);
    getCartTotal();
  }

  decreaseCartItemQuantity(int index) async {
    int orderQuantity =
        _cartItems.value![index].orderQuantity! - 1; // Decrement Quantity
    setCartItemQuantity(index, orderQuantity);
    getCartTotal();
  }

  updateCartItem({required int index, required CartModel cartItem}) async {
    List<CartModel> cartItemsList = _cartItems.value!;
    cartItemsList[index] = cartItem;
    _cartItems.sink.add(cartItemsList);
    getCartTotal();
  }

  deleteCartItem(int index) async {
    List<CartModel> cartItemsList = _cartItems.value!;
    cartItemsList.removeAt(index);
    _cartItems.sink.add(cartItemsList);
    getCartTotal();
  }

  setCartItemQuantity(int index, int quantity) async {
    List<CartModel> cartItemsList = _cartItems.value!;
    cartItemsList[index] = CartModel(
        orderQuantity: quantity, product: cartItemsList[index].product);
    _cartItems.sink.add(cartItemsList);
    getCartTotal();
  }

  getCartTotal() {
    num total = 0;
    List<CartModel> cartItemsList = _cartItems.value!;
    cartItemsList.forEach(
        (item) => total += item.orderQuantity! * item.product!.vendeasePrice!);
    _cartTotal.sink.add(total);
  }

  dispose() {
    _cartItems.close();
  }
}
