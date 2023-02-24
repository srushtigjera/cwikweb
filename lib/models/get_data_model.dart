class get_data_model {
  String? status;
  bool? success;
  String? message;
  Data? data;

  get_data_model({this.status, this.success, this.message, this.data});

  get_data_model.fromJson(Map<String, dynamic> json) {
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
  List<AgentList>? agentList;
  int? totalItems;
  ApiParameters? apiParameters;
  String? loginType;

  Data({this.agentList, this.totalItems, this.apiParameters, this.loginType});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['agentList'] != null) {
      agentList = <AgentList>[];
      json['agentList'].forEach((v) {
        agentList!.add(new AgentList.fromJson(v));
      });
    }
    totalItems = json['totalItems'];
    apiParameters = json['apiParameters'] != null
        ? new ApiParameters.fromJson(json['apiParameters'])
        : null;
    loginType = json['login_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agentList != null) {
      data['agentList'] = this.agentList!.map((v) => v.toJson()).toList();
    }
    data['totalItems'] = this.totalItems;
    if (this.apiParameters != null) {
      data['apiParameters'] = this.apiParameters!.toJson();
    }
    data['login_type'] = this.loginType;
    return data;
  }
}

class AgentList {
  int? addListingId;
  String? listingTitle;
  String? firstClosestUniversity;
  String? walkDistFirstUni;
  String? secondClosestUniversity;
  Null? walkDistSecondUni;
  int? cityId;
  String? postCode;
  String? address;
  String? pricePerWeek;
  String? walkDistTownCenter;
  int? roomSize;
  String? walkDistPublicTrans;
  String? bedSize;
  String? floor;
  String? listingType;
  String? aboutProperty;
  String? facilitiesInclude;
  String? billsInclude;
  int? agentId;
  String? trendListing;
  String? listingStatus;
  String? createdAt;
  String? updatedAt;
  List<SelectedImages>? selectedImages;
  City? city;
  Agent? agent;
  List<AmenitiesArr>? amenitiesArr;

  AgentList(
      {this.addListingId,
        this.listingTitle,
        this.firstClosestUniversity,
        this.walkDistFirstUni,
        this.secondClosestUniversity,
        this.walkDistSecondUni,
        this.cityId,
        this.postCode,
        this.address,
        this.pricePerWeek,
        this.walkDistTownCenter,
        this.roomSize,
        this.walkDistPublicTrans,
        this.bedSize,
        this.floor,
        this.listingType,
        this.aboutProperty,
        this.facilitiesInclude,
        this.billsInclude,
        this.agentId,
        this.trendListing,
        this.listingStatus,
        this.createdAt,
        this.updatedAt,
        this.selectedImages,
        this.city,
        this.agent,
        this.amenitiesArr});

  AgentList.fromJson(Map<String, dynamic> json) {
    addListingId = json['add_listing_id'];
    listingTitle = json['listing_title'];
    firstClosestUniversity = json['first_closest_university'];
    walkDistFirstUni = json['walk_dist_first_uni'];
    secondClosestUniversity = json['second_closest_university'];
    walkDistSecondUni = json['walk_dist_second_uni'];
    cityId = json['city_id'];
    postCode = json['post_code'];
    address = json['address'];
    pricePerWeek = json['price_per_week'];
    walkDistTownCenter = json['walk_dist_town_center'];
    roomSize = json['room_size'];
    walkDistPublicTrans = json['walk_dist_public_trans'];
    bedSize = json['bed_size'];
    floor = json['floor'];
    listingType = json['listing_type'];
    aboutProperty = json['about_property'];
    facilitiesInclude = json['facilities_include'];
    billsInclude = json['bills_include'];
    agentId = json['agent_id'];
    trendListing = json['trend_listing'];
    listingStatus = json['listing_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['selected_images'] != null) {
      selectedImages = <SelectedImages>[];
      json['selected_images'].forEach((v) {
        selectedImages!.add(new SelectedImages.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
    if (json['amenities_arr'] != null) {
      amenitiesArr = <AmenitiesArr>[];
      json['amenities_arr'].forEach((v) {
        amenitiesArr!.add(new AmenitiesArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_listing_id'] = this.addListingId;
    data['listing_title'] = this.listingTitle;
    data['first_closest_university'] = this.firstClosestUniversity;
    data['walk_dist_first_uni'] = this.walkDistFirstUni;
    data['second_closest_university'] = this.secondClosestUniversity;
    data['walk_dist_second_uni'] = this.walkDistSecondUni;
    data['city_id'] = this.cityId;
    data['post_code'] = this.postCode;
    data['address'] = this.address;
    data['price_per_week'] = this.pricePerWeek;
    data['walk_dist_town_center'] = this.walkDistTownCenter;
    data['room_size'] = this.roomSize;
    data['walk_dist_public_trans'] = this.walkDistPublicTrans;
    data['bed_size'] = this.bedSize;
    data['floor'] = this.floor;
    data['listing_type'] = this.listingType;
    data['about_property'] = this.aboutProperty;
    data['facilities_include'] = this.facilitiesInclude;
    data['bills_include'] = this.billsInclude;
    data['agent_id'] = this.agentId;
    data['trend_listing'] = this.trendListing;
    data['listing_status'] = this.listingStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.selectedImages != null) {
      data['selected_images'] =
          this.selectedImages!.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.agent != null) {
      data['agent'] = this.agent!.toJson();
    }
    if (this.amenitiesArr != null) {
      data['amenities_arr'] =
          this.amenitiesArr!.map((v) => v.toJson()).toList();
    }
    return data;
  }


  @override
  String toString() {
    return 'AgentList{addListingId: $addListingId, listingTitle: $listingTitle, firstClosestUniversity: $firstClosestUniversity, walkDistFirstUni: $walkDistFirstUni, secondClosestUniversity: $secondClosestUniversity, walkDistSecondUni: $walkDistSecondUni, cityId: $cityId, postCode: $postCode, address: $address, pricePerWeek: $pricePerWeek, walkDistTownCenter: $walkDistTownCenter, roomSize: $roomSize, walkDistPublicTrans: $walkDistPublicTrans, bedSize: $bedSize, floor: $floor, listingType: $listingType, aboutProperty: $aboutProperty, facilitiesInclude: $facilitiesInclude, billsInclude: $billsInclude, agentId: $agentId, trendListing: $trendListing, listingStatus: $listingStatus, createdAt: $createdAt, updatedAt: $updatedAt, selectedImages: $selectedImages, city: $city, agent: $agent, amenitiesArr: $amenitiesArr}';
  }

 /* @override
  String toString() {
    return '{ ${this.addListingId}, ${this.listingTitle}, ${this.firstClosestUniversity},${this.walkDistFirstUni},${this.secondClosestUniversity}, ${this.walkDistSecondUni}, ${this.cityId}, '
        '${this.postCode}, ${this.address}, ${this.pricePerWeek},${this.walkDistTownCenter},${this.roomSize}, ${this.walkDistPublicTrans}, ${this.bedSize}, ${this.floor},'
        ' ${this.listingType}, ${this.aboutProperty},${this.facilitiesInclude},${this.billsInclude}, ${this.agentId}, ${this.trendListing}, '
        '${this.listingStatus}, ${this.createdAt}, ${this.updatedAt},${this.selectedImages},${this.city},${this.agent}, ${this.amenitiesArr}}';
  }*/
}

class SelectedImages {
  String? images;
  int? id;
  int? addListingId;
  String? createdAt;
  String? updatedAt;

  SelectedImages(
      {this.images,
        this.id,
        this.addListingId,
        this.createdAt,
        this.updatedAt});

  SelectedImages.fromJson(Map<String, dynamic> json) {
    images = json['images'];
    id = json['id'];
    addListingId = json['add_listing_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['id'] = this.id;
    data['add_listing_id'] = this.addListingId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'SelectedImages{ images: $images, id: $id, addListingId: $addListingId, createdAt: $createdAt, updatedAt: $updatedAt }';
  }

}

class City {
  int? cityId;
  String? cityName;
  String? cityLatitude;
  String? cityLongitude;
  String? createdAt;
  String? updatedAt;

  City(
      {this.cityId,
        this.cityName,
        this.cityLatitude,
        this.cityLongitude,
        this.createdAt,
        this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
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
    return 'City{ cityId: $cityId, cityName: $cityName, cityLatitude: $cityLatitude, cityLongitude: $cityLongitude, createdAt: $createdAt, updatedAt: $updatedAt }';
  }
}

class Agent {
  String? agentProfile;
  int? agentId;
  String? agentName;
  String? agentEmail;
  String? agentPassword;
  String? agentPhoneNumber;
  String? nameOfAgency;
  String? aboutOfAgency;
  String? activeListing;
  String? createdAt;
  String? updatedAt;

  Agent(
      {this.agentProfile,
        this.agentId,
        this.agentName,
        this.agentEmail,
        this.agentPassword,
        this.agentPhoneNumber,
        this.nameOfAgency,
        this.aboutOfAgency,
        this.activeListing,
        this.createdAt,
        this.updatedAt});

  Agent.fromJson(Map<String, dynamic> json) {
    agentProfile = json['agent_profile'];
    agentId = json['agent_id'];
    agentName = json['agent_name'];
    agentEmail = json['agent_email'];
    agentPassword = json['agent_password'];
    agentPhoneNumber = json['agent_phone_number'];
    nameOfAgency = json['name_of_agency'];
    aboutOfAgency = json['about_of_agency'];
    activeListing = json['active_listing'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent_profile'] = this.agentProfile;
    data['agent_id'] = this.agentId;
    data['agent_name'] = this.agentName;
    data['agent_email'] = this.agentEmail;
    data['agent_password'] = this.agentPassword;
    data['agent_phone_number'] = this.agentPhoneNumber;
    data['name_of_agency'] = this.nameOfAgency;
    data['about_of_agency'] = this.aboutOfAgency;
    data['active_listing'] = this.activeListing;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'Agent{ agentProfile: $agentProfile, agentId: $agentId, agentName: $agentName, agentEmail: $agentEmail, agentPassword: $agentPassword, agentPhoneNumber: $agentPhoneNumber, nameOfAgency: $nameOfAgency, aboutOfAgency: $aboutOfAgency, activeListing: $activeListing, createdAt: $createdAt, updatedAt: $updatedAt }';
  }
}

class AmenitiesArr {
  String? amenitiesImage;
  int? amenitiesId;
  String? amenitiesName;
  String? createdAt;
  String? updatedAt;
  SelectedAmenities? selectedAmenities;

  AmenitiesArr(
      {this.amenitiesImage,
        this.amenitiesId,
        this.amenitiesName,
        this.createdAt,
        this.updatedAt,
        this.selectedAmenities});

  AmenitiesArr.fromJson(Map<String, dynamic> json) {
    amenitiesImage = json['amenities_image'];
    amenitiesId = json['amenities_id'];
    amenitiesName = json['amenities_name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    selectedAmenities = json['selected_amenities'] != null
        ? new SelectedAmenities.fromJson(json['selected_amenities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amenities_image'] = this.amenitiesImage;
    data['amenities_id'] = this.amenitiesId;
    data['amenities_name'] = this.amenitiesName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.selectedAmenities != null) {
      data['selected_amenities'] = this.selectedAmenities!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AmenitiesArr{ amenitiesId: $amenitiesId, amenitiesName: $amenitiesName, createdAt: $createdAt, updatedAt: $updatedAt, selectedAmenities: $selectedAmenities }';
  }
}

class SelectedAmenities {
  int? id;
  int? addListingId;
  int? amenitiesId;
  String? createdAt;
  String? updatedAt;

  SelectedAmenities(
      {this.id,
        this.addListingId,
        this.amenitiesId,
        this.createdAt,
        this.updatedAt});

  SelectedAmenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addListingId = json['add_listing_id'];
    amenitiesId = json['amenities_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['add_listing_id'] = this.addListingId;
    data['amenities_id'] = this.amenitiesId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() {
    return 'SelectedAmenities{ id: $id, addListingId: $addListingId, amenitiesId: $amenitiesId, createdAt: $createdAt, updatedAt: $updatedAt }';
  }
}

class ApiParameters {
  int? id;
  Null? adminId;
  Null? userId;
  int? agentId;
  String? token;

  ApiParameters({this.id, this.adminId, this.userId, this.agentId, this.token});

  ApiParameters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    agentId = json['agent_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['agent_id'] = this.agentId;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return 'ApiParameters{ id: $id, adminId: $adminId, userId: $userId, agentId: $agentId, token: $token }';
  }
}