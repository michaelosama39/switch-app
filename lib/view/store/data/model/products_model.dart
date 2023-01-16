class ProductsModel {
  String? status;
  List<ProductsData>? data;

  ProductsModel({this.status, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProductsData>[];
      json['data'].forEach((v) {
        data!.add(new ProductsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsData {
  int? id;
  String? productName;
  String? price;
  String? image;

  ProductsData({this.id, this.productName, this.price, this.image});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
