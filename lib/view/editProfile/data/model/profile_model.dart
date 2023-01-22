class ProfileModel {
  User? user;
  String? qrcode;

  ProfileModel({this.user , this.qrcode});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    qrcode = json['qrcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['qrcode'] = this.qrcode;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
