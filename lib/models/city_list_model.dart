class CityListModel {
  String? status;
  bool? success;
  String? message;
  Data? data;

  CityListModel({this.status, this.success, this.message, this.data});

  CityListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<CityList>? cityList;
  int? totalItems;
  String? loginType;

  Data({this.cityList, this.totalItems, this.loginType});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cityList'] != null) {
      cityList = <CityList>[];
      json['cityList'].forEach((v) {
        cityList!.add(new CityList.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
    loginType = json['login_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cityList != null) {
      data['cityList'] = this.cityList!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    data['login_type'] = this.loginType;
    return data;
  }
}

class CityList {
  int? cityId;
  String? cityName;
  String? cityLatitude;
  String? cityLongitude;
  String? createdAt;
  String? updatedAt;

  CityList(
      {this.cityId,
        this.cityName,
        this.cityLatitude,
        this.cityLongitude,
        this.createdAt,
        this.updatedAt});

  CityList.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    cityLatitude = json['city_latitude'];
    cityLongitude = json['city_longitude'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['city_latitude'] = this.cityLatitude;
    data['city_longitude'] = this.cityLongitude;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'CityList{ city_id: $cityId, city_name: $cityName, city_latitude: $cityLatitude, city_longitude: $cityLongitude, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}