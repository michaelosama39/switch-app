class UserModel {
  bool? status;
  String? message;
  String? token;
  String? qrCode;
  UserData? user;

  UserModel({this.status, this.message, this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    qrCode = json['qrCode'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['qrCode'] = this.qrCode;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? familyName;
  String? jobTitle;
  String? email;
  String? phone;
  String? bio;
  String? language;
  String? image;
  String? backgroundImage;

  UserData(
      {this.id,
        this.name,
        this.familyName,
        this.jobTitle,
        this.email,
        this.phone,
        this.bio,
        this.language,
        this.image,
        this.backgroundImage});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    familyName = json['familyName'];
    jobTitle = json['job_title'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    language = json['language'];
    image = json['image'];
    backgroundImage = json['background_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['familyName'] = this.familyName;
    data['job_title'] = this.jobTitle;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['bio'] = this.bio;
    data['language'] = this.language;
    data['image'] = this.image;
    data['background_image'] = this.backgroundImage;
    return data;
  }
}
