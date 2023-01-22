class ConnectionModel {
  bool? status;
  String? message;
  List<ConnectionData>? data;

  ConnectionModel({this.status, this.message, this.data});

  ConnectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ConnectionData>[];
      json['data'].forEach((v) {
        data!.add(new ConnectionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConnectionData {
  int? id;
  String? name;
  String? company;
  String? title;
  String? country;
  String? phone;
  String? email;
  String? subject;
  String? content;
  String? status;
  String? userId;
  String? userType;
  String? createdAt;
  String? updatedAt;

  ConnectionData(
      {this.id,
        this.name,
        this.company,
        this.title,
        this.country,
        this.phone,
        this.email,
        this.subject,
        this.content,
        this.status,
        this.userId,
        this.userType,
        this.createdAt,
        this.updatedAt});

  ConnectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    company = json['company'];
    title = json['title'];
    country = json['country'];
    phone = json['phone'];
    email = json['email'];
    subject = json['subject'];
    content = json['content'];
    status = json['status'];
    userId = json['user_id'];
    userType = json['user_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company'] = this.company;
    data['title'] = this.title;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['subject'] = this.subject;
    data['content'] = this.content;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
