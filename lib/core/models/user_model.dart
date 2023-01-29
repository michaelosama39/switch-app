class UserModel {
  bool? status;
  String? message;
  UserData? data;
  List<Accounts>? accounts;
  String? qrcode;
  String? token;

  UserModel({this.status, this.message, this.data, this.accounts, this.qrcode , this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
    if (json['accounts'] != null) {
      accounts = <Accounts>[];
      json['accounts'].forEach((v) {
        accounts!.add(new Accounts.fromJson(v));
      });
    }
    qrcode = json['qrcode'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    data['qrcode'] = this.qrcode;
    data['token'] = this.token;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? familyName;
  String? email;
  String? language;
  String? phone;
  String? jobTitle;
  Null? bio;
  String? image;
  String? backgroundImage;

  UserData(
      {this.id,
        this.name,
        this.familyName,
        this.email,
        this.language,
        this.phone,
        this.jobTitle,
        this.bio,
        this.image,
        this.backgroundImage});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    familyName = json['familyName'];
    email = json['email'];
    language = json['language'];
    phone = json['phone'];
    jobTitle = json['job_title'];
    bio = json['bio'];
    image = json['image'];
    backgroundImage = json['background_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['familyName'] = this.familyName;
    data['email'] = this.email;
    data['language'] = this.language;
    data['phone'] = this.phone;
    data['job_title'] = this.jobTitle;
    data['bio'] = this.bio;
    data['image'] = this.image;
    data['background_image'] = this.backgroundImage;
    return data;
  }
}

class Accounts {
  int? id;
  String? pageTitle;
  String? url;
  String? userName;
  String? categoryName;
  Account? account;

  Accounts(
      {this.id,
        this.pageTitle,
        this.url,
        this.userName,
        this.categoryName,
        this.account});

  Accounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageTitle = json['page_title'];
    url = json['url'];
    userName = json['User name'];
    categoryName = json['category_name'];
    account =
    json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_title'] = this.pageTitle;
    data['url'] = this.url;
    data['User name'] = this.userName;
    data['category_name'] = this.categoryName;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    return data;
  }
}

class Account {
  String? name;
  String? icon;

  Account({this.name, this.icon});

  Account.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
