class ApplicationsModel {
  String? status;
  List<ApplicationsData>? item;

  ApplicationsModel({this.status, this.item});

  ApplicationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['item'] != null) {
      item = <ApplicationsData>[];
      json['item'].forEach((v) {
        item!.add(new ApplicationsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.item != null) {
      data['item'] = this.item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApplicationsData {
  int? id;
  String? name;
  String? icon;

  ApplicationsData({this.id, this.name, this.icon});

  ApplicationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
