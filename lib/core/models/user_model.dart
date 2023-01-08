class UserModel {
  String? status;
  UserData? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsAPP;
  String? emailVerifiedAt;
  String? photo;
  var provianceID;
  var cityID;
  var areaID;
  String? mapLong;
  String? mapLat;
  int? activationCode;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.whatsAPP,
        this.emailVerifiedAt,
        this.photo,
        this.provianceID,
        this.cityID,
        this.areaID,
        this.mapLong,
        this.mapLat,
        this.activationCode,
        this.deviceToken,
        this.createdAt,
        this.updatedAt,
      });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    whatsAPP = json['WhatsAPP'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    provianceID = json['ProvianceID'];
    cityID = json['CityID'];
    areaID = json['AreaID'];
    mapLong = json['mapLong'];
    mapLat = json['mapLat'];
    activationCode = json['ActivationCode'];
    deviceToken = json['DeviceToken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['WhatsAPP'] = this.whatsAPP;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['photo'] = this.photo;
    if (this.provianceID != null) {
      data['ProvianceID'] = this.provianceID!.toJson();
    }
    if (this.cityID != null) {
      data['CityID'] = this.cityID!.toJson();
    }
    if (this.areaID != null) {
      data['AreaID'] = this.areaID!.toJson();
    }
    data['mapLong'] = this.mapLong;
    data['mapLat'] = this.mapLat;
    data['ActivationCode'] = this.activationCode;
    data['DeviceToken'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProvianceID {
  int? id;
  String? name;

  ProvianceID({this.id, this.name});

  ProvianceID.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}