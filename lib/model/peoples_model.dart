class PeoplesModel {
  String? sId;
  Name? name;
  String? email;
  String? picture;
  Location? location;

  PeoplesModel({this.sId, this.name, this.email, this.picture, this.location});

  PeoplesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] != null ? new Name.fromJson(json['name'].cast<String, dynamic>()) : null;
    email = json['email'];
    picture = json['picture'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'].cast<String, dynamic>())
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.name != null) {
      data['name'] = this.name?.toJson();
    }
    data['email'] = this.email;
    data['picture'] = this.picture;
    if (this.location != null) {
      data['location'] = this.location?.toJson();
    }
    return data;
  }
}

class Name {
  String? last;
  String? first;

  Name({this.last, this.first});

  Name.fromJson(Map<String, dynamic> json) {
    last = json['last'];
    first = json['first'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last'] = this.last;
    data['first'] = this.first;
    return data;
  }
}

class Location {
  double?latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

