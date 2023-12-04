class GetProfileModel {
  Profile? profile;
  String? msg;
  bool? status;

  GetProfileModel({this.profile, this.msg, this.status});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Profile {
  String? userId;
  String? userName;
  String? email;
  Null? dob;
  String? mobile;
  String? password;
  String? apiKey;
  String? referralCode;
  String? referredBy;
  String? securityPin;
  String? image;
  Null? address;
  String? walletBalance;
  String? holdAmount;
  String? lastUpdate;
  String? insertDate;
  String? status;
  String? verified;
  String? bettingStatus;
  String? notificationStatus;
  String? transferPointStatus;

  Profile(
      {this.userId,
        this.userName,
        this.email,
        this.dob,
        this.mobile,
        this.password,
        this.apiKey,
        this.referralCode,
        this.referredBy,
        this.securityPin,
        this.image,
        this.address,
        this.walletBalance,
        this.holdAmount,
        this.lastUpdate,
        this.insertDate,
        this.status,
        this.verified,
        this.bettingStatus,
        this.notificationStatus,
        this.transferPointStatus});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    email = json['email'];
    dob = json['dob'];
    mobile = json['mobile'];
    password = json['password'];
    apiKey = json['api_key'];
    referralCode = json['referral_code'];
    referredBy = json['referred_by'];
    securityPin = json['security_pin'];
    image = json['image'];
    address = json['address'];
    walletBalance = json['wallet_balance'];
    holdAmount = json['hold_amount'];
    lastUpdate = json['last_update'];
    insertDate = json['insert_date'];
    status = json['status'];
    verified = json['verified'];
    bettingStatus = json['betting_status'];
    notificationStatus = json['notification_status'];
    transferPointStatus = json['transfer_point_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['api_key'] = this.apiKey;
    data['referral_code'] = this.referralCode;
    data['referred_by'] = this.referredBy;
    data['security_pin'] = this.securityPin;
    data['image'] = this.image;
    data['address'] = this.address;
    data['wallet_balance'] = this.walletBalance;
    data['hold_amount'] = this.holdAmount;
    data['last_update'] = this.lastUpdate;
    data['insert_date'] = this.insertDate;
    data['status'] = this.status;
    data['verified'] = this.verified;
    data['betting_status'] = this.bettingStatus;
    data['notification_status'] = this.notificationStatus;
    data['transfer_point_status'] = this.transferPointStatus;
    return data;
  }
}
