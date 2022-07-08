class ProductModel {
  String? sId;
  String? image;
  num? vendorPrice;
  num? vendeasePrice;
  num? marketPrice;
  bool? discountDeleted;
  bool? deleted;
  String? name;
  String? categoryId;
  String? subCategoryId;
  String? description;
  Discount? discount;
  String? weight;
  String? weightUnit;
  String? countryCode;
  String? cityCode;
  String? ownerType;
  String? owner;
  String? createdAt;
  String? updatedAt;
  CategoryDetails? categoryDetails;

  ProductModel(
      {this.sId,
      this.image,
      this.vendorPrice,
      this.vendeasePrice,
      this.marketPrice,
      this.discountDeleted,
      this.deleted,
      this.name,
      this.categoryId,
      this.subCategoryId,
      this.description,
      this.discount,
      this.weight,
      this.weightUnit,
      this.countryCode,
      this.cityCode,
      this.ownerType,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.categoryDetails});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    vendorPrice = json['vendor_price'];
    vendeasePrice = json['vendease_price'];
    marketPrice = json['market_price'];
    discountDeleted = json['discount_deleted'];
    deleted = json['deleted'];
    name = json['name'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    description = json['description'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    countryCode = json['countryCode'];
    cityCode = json['cityCode'];
    ownerType = json['owner_type'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    categoryDetails = json['category_details'] != null
        ? new CategoryDetails.fromJson(json['category_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['vendor_price'] = this.vendorPrice;
    data['vendease_price'] = this.vendeasePrice;
    data['market_price'] = this.marketPrice;
    data['discount_deleted'] = this.discountDeleted;
    data['deleted'] = this.deleted;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['description'] = this.description;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['weight'] = this.weight;
    data['weight_unit'] = this.weightUnit;
    data['countryCode'] = this.countryCode;
    data['cityCode'] = this.cityCode;
    data['owner_type'] = this.ownerType;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.categoryDetails != null) {
      data['category_details'] = this.categoryDetails!.toJson();
    }
    return data;
  }
}

class CategoryDetails {
  String? name;
  bool? taxExempt;
  Discount? discount;
  String? subCategory;

  CategoryDetails({this.name, this.taxExempt, this.discount, this.subCategory});

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    taxExempt = json['tax_exempt'];
    discount = json['discount'] != null
        ? new Discount.fromJson(json['discount'])
        : null;
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['tax_exempt'] = this.taxExempt;
    if (this.discount != null) {
      data['discount'] = this.discount!.toJson();
    }
    data['sub_category'] = this.subCategory;
    return data;
  }
}

class Discount {
  String? discountType;
  num? discountValue;
  String? sId;

  Discount({this.discountType, this.discountValue, this.sId});

  Discount.fromJson(Map<String, dynamic> json) {
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount_type'] = this.discountType;
    data['discount_value'] = this.discountValue;
    data['_id'] = this.sId;
    return data;
  }
}
