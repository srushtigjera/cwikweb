class AmenitiesModel {
  String? status;
  bool? success;
  String? message;
  Data? data;

  AmenitiesModel({this.status, this.success, this.message, this.data});

  AmenitiesModel.fromJson(Map<String, dynamic> json) {
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
  List<AmenitiesList>? amenitiesList;
  int? totalItems;
  String? loginType;

  Data({this.amenitiesList, this.totalItems, this.loginType});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['amenitiesList'] != null) {
      amenitiesList = <AmenitiesList>[];
      json['amenitiesList'].forEach((v) {
        amenitiesList!.add(new AmenitiesList.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
    loginType = json['login_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amenitiesList != null) {
      data['amenitiesList'] =
          this.amenitiesList!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    data['login_type'] = this.loginType;
    return data;
  }
}

class AmenitiesList {
  String? amenitiesImage;
  int? amenitiesId;
  String? amenitiesName;
  String? createdAt;
  String? updatedAt;

  AmenitiesList(
      {this.amenitiesImage,
        this.amenitiesId,
        this.amenitiesName,
        this.createdAt,
        this.updatedAt});

  AmenitiesList.fromJson(Map<String, dynamic> json) {
    amenitiesImage = json['amenities_image'];
    amenitiesId = json['amenities_id'];
    amenitiesName = json['amenities_name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amenities_image'] = this.amenitiesImage;
    data['amenities_id'] = this.amenitiesId;
    data['amenities_name'] = this.amenitiesName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}