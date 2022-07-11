import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/blocs/cart_bloc.dart';
import 'package:vendease_test/src/blocs/provider.dart';
import 'package:vendease_test/src/models/cart_model.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';
import 'package:vendease_test/src/wigdets/custom_button.dart';
import 'package:vendease_test/src/wigdets/custom_text_form_field.dart';
import 'package:vendease_test/src/wigdets/naira.dart';
import 'package:vendease_test/src/wigdets/network_image.dart';
import 'package:vendease_test/src/wigdets/toast_text.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Remove Keyboard view
    FocusScope.of(context).unfocus();
    CartBloc cartBloc = BlocProvider.cart(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor2.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child:
                        SvgPicture.asset(SvgIcons.chevronRight, height: 16.0),
                  ),
                  SizedBox(width: 18.0),
                  Text(
                    'Your cart',
                    style: TextStyle(
                      color: AppColors.blackText.withOpacity(0.9),
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  StreamBuilder<List<CartModel>?>(
                      stream: cartBloc.cartItems,
                      builder:
                          (context, AsyncSnapshot<List<CartModel>?> snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          );
                        }

                        int cartCount = snapshot.data?.length ?? 0;

                        return Text(
                          cartCount > 1
                              ? '$cartCount items'
                              : '$cartCount item',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 16.0),
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.0),
                border:
                    Border.all(color: AppColors.darkBorderColor, width: 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        autofocus: false,
                        margin: EdgeInsets.zero,
                        textInputAction: TextInputAction.done,
                        borderColor: AppColors.white,
                        filled: false,
                        enabledBorderColor: AppColors.white,
                        focusedBorderColor: AppColors.white,
                        contentPaddingVertical: 0,
                        textFormFieldStyle: TextStyle(fontSize: 16.0),
                        hintText: 'Search Products',
                        // enabled: false,
                        // controller:searchFieldController,
                      ),
                    ),
                  ),
                  SvgPicture.asset(SvgIcons.search2),
                  SizedBox(width: 6.0),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            StreamBuilder<List<CartModel>?>(
                stream: cartBloc.cartItems,
                builder: (context, AsyncSnapshot<List<CartModel>?> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data?.length == 0) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.all(64.0),
                      child: Column(
                        children: [
                          Text(
                            'Cart is Empty!'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'You are yet to add any item to you cart',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ));
                  }

                  List<CartModel> cartItems = snapshot.data!;
                  return ListView.builder(
                      itemCount: cartItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // var titles = ['Watermelon', 'Pineapples', 'Catfish'];
                        // var images = [AppImages.watermelon, AppImages.pineapple, AppImages.catfish ];
                        return CartItem(
                          index: index,
                          item: cartItems[index],
                        );
                      });
                }),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductsTabNav);
                  },
                  child: Text(
                    '+ Add Products ',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL',
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    StreamBuilder<num?>(
                        stream: cartBloc.cartTotal,
                        builder: (context, AsyncSnapshot<num?> snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          }
                          num cartTotal = snapshot.data ?? 0;
                          return Naira(
                            cartTotal,
                            nairaStyle:
                                TextStyle(fontWeight: FontWeight.normal),
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          );
                        }),
                  ],
                ),
                SizedBox(height: 24.0),
                Text(
                  'Delivery fee not included yet',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 16.0),
                CustomButton(
                  title: 'Check out',
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, HomeTabNav),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final CartModel item;
  final int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = BlocProvider.cart(context);

    return Container(
      width: 130,
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        children: [
          PNetworkImage(
            '${widget.item.product!.image}',
            height: 70.0,
            width: 85.0,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.item.product?.name}',
                  style: TextStyle(
                      color: AppColors.blackText.withOpacity(0.8),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.0),
                Text(
                  '${widget.item.orderQuantity} ${widget.item.product?.weightUnit}',
                  style: TextStyle(
                    color: AppColors.black.withOpacity(0.5),
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Naira(
                  widget.item.orderQuantity! *
                      widget.item.product!.vendeasePrice!,
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => cartBloc.deleteCartItem(widget.index),
                  child: SvgPicture.asset(SvgIcons.delete)),
              SizedBox(height: 36.0),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (widget.item.orderQuantity == 1)
                          showToastWidget(
                              ToastText(text: 'Item cannot be less than 1'));
                        else
                          cartBloc.decreaseCartItemQuantity(widget.index);
                      },
                      // onTap: decrementCount,
                      child: SvgPicture.asset(SvgIcons.subtract)),
                  SizedBox(width: 8.0),
                  Container(
                    width: 28.0,
                    child: Center(
                      child: Text('${widget.item.orderQuantity}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                      onTap: () =>
                          cartBloc.increaseCartItemQuantity(widget.index),
                      // onTap: incrementCount,
                      child: SvgPicture.asset(SvgIcons.add)),
                ],
              ),
            ],
          ),
          SizedBox(width: 4.0),
        ],
      ),
    );
  }
}
