class NoticeModel {
  List<Notices>? notices;
  String? mobileNo;
  String? msg;
  bool? status;

  NoticeModel({this.notices, this.mobileNo, this.msg, this.status});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    if (json['notices'] != null) {
      notices = <Notices>[];
      json['notices'].forEach((v) {
        notices!.add(new Notices.fromJson(v));
      });
    }
    mobileNo = json['mobile_no'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notices != null) {
      data['notices'] = this.notices!.map((v) => v.toJson()).toList();
    }
    data['mobile_no'] = this.mobileNo;
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Notices {
  String? noticeTitle;
  String? noticeMsg;
  String? noticeDate;
  String? insertDate;

  Notices({this.noticeTitle, this.noticeMsg, this.noticeDate, this.insertDate});

  Notices.fromJson(Map<String, dynamic> json) {
    noticeTitle = json['notice_title'];
    noticeMsg = json['notice_msg'];
    noticeDate = json['notice_date'];
    insertDate = json['insert_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notice_title'] = this.noticeTitle;
    data['notice_msg'] = this.noticeMsg;
    data['notice_date'] = this.noticeDate;
    data['insert_date'] = this.insertDate;
    return data;
  }
}
