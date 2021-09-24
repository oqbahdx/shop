class ChangeFavoriteModel {
  bool status;
  String message;
  FavoriteDataModel data;

  ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? FavoriteDataModel.fromJson(json['data']) : null;
  }
}

class FavoriteDataModel {
  int id;
  List<ProductModel> product;

  FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'].forEach((element) {
      product.add(element);
    });
  }
}

class ProductModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  String image;
  dynamic discount;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    discount = json['discount'];
  }
}
