class VideoModel {
  List<Content>? content;
  String? msg;
  bool? status;

  VideoModel({this.content, this.msg, this.status});

  VideoModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Content {
  String? howToPlayContent;
  String? videoLink;

  Content({this.howToPlayContent, this.videoLink});

  Content.fromJson(Map<String, dynamic> json) {
    howToPlayContent = json['how_to_play_content'];
    videoLink = json['video_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['how_to_play_content'] = this.howToPlayContent;
    data['video_link'] = this.videoLink;
    return data;
  }
}
