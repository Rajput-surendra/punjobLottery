class HomeSliderReponse {
  bool? status;
  String? message;
  List<SliderDataList>? data;

  HomeSliderReponse({this.status, this.message, this.data});

  HomeSliderReponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SliderDataList>[];
      json['data'].forEach((v) {
        data!.add(new SliderDataList.fromJson(v));
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

class SliderDataList {
  int? id;
  String? title;
  String? code;
  String? image;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  SliderDataList(
      {this.id,
        this.title,
        this.code,
        this.image,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  SliderDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    image = json['image'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
