class HomeCatReponse {
  bool? status;
  String? message;
  List<HomeCatList>? data;

  HomeCatReponse({this.status, this.message, this.data});

  HomeCatReponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeCatList>[];
      json['data'].forEach((v) {
        data!.add(new HomeCatList.fromJson(v));
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

class HomeCatList {
  int? id;
  String? title;
  bool? isSelected;

  HomeCatList({this.id, this.title});

  HomeCatList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isSelected = false ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
