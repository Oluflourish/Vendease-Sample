import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendease_test/src/blocs/product_bloc.dart';
import 'package:vendease_test/src/blocs/provider.dart';
import 'package:vendease_test/src/models/product_model.dart';
import 'package:vendease_test/src/utils/colors.dart';
import 'package:vendease_test/src/utils/navigation.dart';
import 'package:vendease_test/src/utils/helpers.dart';
import 'package:vendease_test/src/utils/svg_icons.dart';
import 'package:vendease_test/src/wigdets/custom_text_form_field.dart';
import 'package:vendease_test/src/wigdets/network_image.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    // Remove Keyboard view
    // FocusScope.of(context).unfocus();

    ProductBloc productBloc = BlocProvider.product(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor2.withOpacity(0.1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                'Products',
                style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: ''),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.dividerColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6.0),
                border:
                    Border.all(color: AppColors.darkBorderColor, width: 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(SvgIcons.search),
                  SizedBox(width: 6.0),
                  Expanded(
                    child: CustomTextFormField(
                      autofocus: false,
                      margin: EdgeInsets.zero,
                      textInputAction: TextInputAction.done,
                      borderColor: AppColors.white,
                      filled: false,
                      enabledBorderColor: AppColors.white,
                      focusedBorderColor: AppColors.white,
                      contentPaddingVertical: 0,
                      textFormFieldStyle: TextStyle(fontSize: 14.0),
                      hintText: 'Search Products',
                      // controller:searchFieldController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder<Map<String, List<ProductModel>>?>(
                  stream: productBloc.productsDictionary,
                  builder: (context,
                      AsyncSnapshot<Map<String, List<ProductModel>>?>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data?.length == 0) {
                      return Text('Ooopsss!... No products');
                    }

                    Map<String, List<ProductModel>>? pDictionary =
                        snapshot.data;

                    var tabNames = pDictionary?.keys.toList();
                    var tabContents = pDictionary?.values.toList();

                    return DefaultTabController(
                      length: pDictionary!.length,
                      child: Column(
                        children: [
                          Container(
                            height: 26,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 0.5, color: AppColors.dividerColor),
                              ),
                            ),
                            child: TabBar(
                              // labelPadding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,
                              unselectedLabelColor: AppColors.grey,
                              indicatorSize: TabBarIndicatorSize.tab,
                              labelColor: AppColors.primaryColor,
                              indicatorWeight: 1.5,
                              indicatorColor: AppColors.primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 14.0,
                                letterSpacing: .4,
                              ),
                              isScrollable: true,
                              // tabs: [
                              //   Tab(text: "All Products"),
                              //   Tab(text: "Fruits and Vegetables"),
                              //   Tab(text: "Toiletries"),
                              // ]

                              tabs:
                                  tabNames!.map((tn) => Tab(text: tn)).toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    // children: [
                                    //   _tabList(productBloc),
                                    //   _tabList(productBloc),
                                    //   _tabList(productBloc),
                                    // ],
                                    children: tabContents!
                                        .map((tn) => _tabListt(tn))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Container _tabListt(List<ProductModel> products) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: StreamBuilder<List<ProductModel>?>(
          // stream: productBloc.products,
          builder: (context, AsyncSnapshot<List<ProductModel>?> snapshot) {
        // if (!snapshot.hasData) {
        //   return Center(child: CircularProgressIndicator());
        // }

        // if (snapshot.data?.length == 0) {
        //   return Text('Ooopsss!... No products');
        // }

        return ListView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              ProductModel productModel = products[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
                margin: EdgeInsets.symmetric(vertical: 6.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(7.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.03),
                      spreadRadius: 0.2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    PNetworkImage(
                      '${productModel.image}',
                      height: 54.0,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${productModel.name}',
                                  style: TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              InkWell(
                                  onTap: () =>
                                      Navigator.pushNamed(context, CartNav),
                                  child: SvgPicture.asset(SvgIcons.addCart)),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${productModel.categoryDetails!.name!.capitalize()}',
                                style: TextStyle(
                                  color: AppColors.black.withOpacity(0.5),
                                  fontSize: 12.0,
                                ),
                              ),
                              PopupMenuButton<String>(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      productModel.deleted ?? false
                                          ? 'Unavailable'
                                          : 'Available',
                                      style: TextStyle(
                                        color: productModel.deleted ?? false
                                            ? AppColors.red
                                            : AppColors.green,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 2),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                onSelected: (String vale) {},
                                offset: Offset(0, 30),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    'Available',
                                    'Unavailable',
                                  ].map((String title) {
                                    return PopupMenuItem<String>(
                                      value: title,
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 12.5),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.dividerColor,
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PopupMenuButton<String>(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${productModel.weightUnit!.capitalize()}',
                                      style: TextStyle(
                                        color: AppColors.darkText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(0, 2),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                onSelected: (String vale) {},
                                offset: Offset(0, 24),
                                itemBuilder: (BuildContext context) {
                                  return [
                                    '${productModel.weightUnit!.capitalize()}',
                                  ].map((String title) {
                                    return PopupMenuItem<String>(
                                      value: title,
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 12.5),
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                              Text(
                                '₦${'${currencyFormatter(productModel.vendeasePrice, hasDecimal: true)}'}',
                                style: TextStyle(
                                  color: AppColors.darkText,
                                  fontSize: 14.0,
                                  letterSpacing: 0.7,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }

  Container _tabList(ProductBloc productBloc) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: StreamBuilder<List<ProductModel>?>(
          stream: productBloc.products,
          builder: (context, AsyncSnapshot<List<ProductModel>?> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.data?.length == 0) {
              return Text('Ooopsss!... No products');
            }

            return ListView.builder(
                itemCount: snapshot.data?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ProductModel productModel = snapshot.data![index];
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(7.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.03),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Image(
                        //   height: 54.0,
                        //   image: AssetImage(index % 2 == 0
                        //       ? AppImages.product1
                        //       : AppImages.product2),
                        // ),
                        PNetworkImage(
                          '${productModel.image}',
                          height: 54.0,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${productModel.name}',
                                      style: TextStyle(
                                          color: AppColors.darkText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(width: 8.0),
                                  InkWell(
                                      onTap: () =>
                                          Navigator.pushNamed(context, CartNav),
                                      child:
                                          SvgPicture.asset(SvgIcons.addCart)),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${productModel.categoryDetails!.name!.capitalize()}',
                                    style: TextStyle(
                                      color: AppColors.black.withOpacity(0.5),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    productModel.deleted ?? false
                                        ? 'Unavailable'
                                        : 'Available',
                                    style: TextStyle(
                                      color: productModel.deleted ?? false
                                          ? AppColors.red
                                          : AppColors.green,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Divider(
                                thickness: 1,
                                color: AppColors.dividerColor,
                              ),
                              SizedBox(height: 2.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${productModel.weightUnit!.capitalize()}',
                                    style: TextStyle(
                                      color: AppColors.darkText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  Text(
                                    '₦${'${currencyFormatter(productModel.vendeasePrice, hasDecimal: true)}'}',
                                    style: TextStyle(
                                      color: AppColors.darkText,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
