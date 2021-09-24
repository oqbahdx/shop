class FavoriteModel {
  bool status;
  FavoriteDataModel data;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        json['data'] != null ? FavoriteDataModel.fromJson(json['data']) : null;
  }
}

class FavoriteDataModel {
  int currentPage;
  List<DataModel> data = [];

  FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data = json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}

class DataModel {
  int id;
  List<ProductModel> product = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'].forEach((element) {
      product.add(ProductModel.fromJson(element));
    });
  }
}

class ProductModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  String description;
  String image;
  String name;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    description = json['description'];
    name = json['name'];
    image = json['image'];
  }
}
