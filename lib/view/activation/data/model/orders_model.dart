class OrdersModel {
  bool? status;
  List<OrdersData>? data;

  OrdersModel({this.status, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <OrdersData>[];
      json['data'].forEach((v) {
        data!.add(new OrdersData.fromJson(v));
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

class OrdersData {
  int? id;
  String? userId;
  List<Product>? product;
  String? status;

  OrdersData({this.id, this.userId, this.product, this.status});

  OrdersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    if (json['product_id'] != null) {
      product = <Product>[];
      json['product_id'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.product != null) {
      data['product_id'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Product {
  int? id;
  String? productName;
  String? price;
  String? image;

  Product({this.id, this.productName, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
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
