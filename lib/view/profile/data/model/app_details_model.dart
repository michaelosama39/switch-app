class AppDetailsModel {
  List<AppDetailsData>? accounts;

  AppDetailsModel({this.accounts});

  AppDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['accounts'] != null) {
      accounts = <AppDetailsData>[];
      json['accounts'].forEach((v) {
        accounts!.add(new AppDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accounts != null) {
      data['accounts'] = this.accounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppDetailsData {
  int? id;
  int? status_app;
  String? pageTitle;
  String? url;
  String? userName;
  String? categoryName;
  Account? account;

  AppDetailsData(
      {this.id,
        this.status_app,
        this.pageTitle,
        this.url,
        this.userName,
        this.categoryName,
        this.account});

  AppDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status_app = json['status'];
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
    data['status'] = this.status_app;
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
