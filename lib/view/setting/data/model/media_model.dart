class MediaModel {
  bool? status;
  MediaData? data;

  MediaModel({this.status, this.data});

  MediaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new MediaData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MediaData {
  SEO? sEO;
  Social? social;
  Images? images;
  ContactData? contactData;

  MediaData({this.sEO, this.social, this.images, this.contactData});

  MediaData.fromJson(Map<String, dynamic> json) {
    sEO = json['SEO'] != null ? new SEO.fromJson(json['SEO']) : null;
    social =
    json['social'] != null ? new Social.fromJson(json['social']) : null;
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    contactData = json['contact_data'] != null
        ? new ContactData.fromJson(json['contact_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sEO != null) {
      data['SEO'] = this.sEO!.toJson();
    }
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    if (this.contactData != null) {
      data['contact_data'] = this.contactData!.toJson();
    }
    return data;
  }
}

class SEO {
  String? title;

  SEO({this.title});

  SEO.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class Social {
  String? facebook;
  String? twitter;
  String? linkedin;
  String? gmail;

  Social({this.facebook, this.twitter, this.linkedin, this.gmail});

  Social.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    gmail = json['gmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['gmail'] = this.gmail;
    return data;
  }
}

class Images {
  String? logo;

  Images({this.logo});

  Images.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    return data;
  }
}

class ContactData {
  String? phone;
  String? email;

  ContactData({this.phone, this.email});

  ContactData.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
