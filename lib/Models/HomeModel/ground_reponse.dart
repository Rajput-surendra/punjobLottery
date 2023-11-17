class HomeGoundReponse {
  bool? status;
  String? message;
  List<GroundList>? data;

  HomeGoundReponse({this.status, this.message, this.data});

  HomeGoundReponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GroundList>[];
      json['data'].forEach((v) {
        data!.add(new GroundList.fromJson(v));
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

class GroundList {
  int? id;
  int? vendorId;
  Null? timeId;
  String? title;
  int? categoryId;
  String? description;
  String? address;
  int? defaultPrice;
  int? isActive;
  Null? offerDay;
  String? image;
  String? createdAt;
  String? updatedAt;

  GroundList(
      {this.id,
        this.vendorId,
        this.timeId,
        this.title,
        this.categoryId,
        this.description,
        this.address,
        this.defaultPrice,
        this.isActive,
        this.offerDay,
        this.image,
        this.createdAt,
        this.updatedAt});

  GroundList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendor_id'];
    timeId = json['time_id'];
    title = json['title'];
    categoryId = json['category_id'];
    description = json['description'];
    address = json['address'];
    defaultPrice = json['default_price'];
    isActive = json['is_active'];
    offerDay = json['offer_day'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['time_id'] = this.timeId;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['address'] = this.address;
    data['default_price'] = this.defaultPrice;
    data['is_active'] = this.isActive;
    data['offer_day'] = this.offerDay;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
