/// msg : "Lotteries list."
/// data : {"name":"Matka Lottery","lotteries":[{"game_id":"24","game_name":"Matka Lottery","game_name_hindi":"","open_time":"02:00 PM","open_time_sort":"00:00:00","close_time":"06:30 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-24","result_date":"2023-11-27","result_time":"12:12","ticket_price":"500","image":"https://developmentalphawizz.com/lottery/assets/images/1700829485alpha_giftnew_logo.png","lottery_number":"","winners":[{"id":"22","game_id":"24","winner_price":"100000","winning_position":"1st","lottery_no":"PB101","lottery_number":"PB101","user_id":"39","book_status":"1","purchase_status":"1","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"25","game_id":"24","winner_price":"80000","winning_position":"2nd","lottery_no":"PB104","lottery_number":"PB104","user_id":"6","book_status":"1","purchase_status":"1","user_name":"Sunil","email":"","mobile":"8888647482","password":"e10adc3949ba59abbe56e057f20f883e","api_key":"","referral_code":"","referred_by":"","security_pin":"9992","image":"uploads/img/user/user.png","wallet_balance":"13000","hold_amount":"0","last_update":"2023-10-20 19:38:39","insert_date":"2023-11-24 12:54:24","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"27","game_id":"24","winner_price":"50000","winning_position":"3rd","lottery_no":"PB106","lottery_number":"PB106","user_id":"21","book_status":"1","purchase_status":"1","user_name":"Surendra","email":"","mobile":"9999999999","password":"","api_key":"","referral_code":"2675db01c965","referred_by":"","security_pin":"3053","image":"user.png","wallet_balance":"0","hold_amount":"0","last_update":"2023-11-08 17:16:25","insert_date":"2023-11-23 16:05:24","status":"1","verified":"0","betting_status":"0","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"1"},{"game_id":"25","game_name":"Matka Lottery","game_name_hindi":"","open_time":"11:11 AM","open_time_sort":"00:00:00","close_time":"12:12 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-25","result_date":"2023-11-30","result_time":"12:12","ticket_price":"20","image":"https://developmentalphawizz.com/lottery/assets/images/","lottery_number":"","winners":[{"id":"30","game_id":"25","winner_price":"11110","winning_position":"1st","lottery_no":"PB101000","lottery_number":"PB101000","user_id":"39","book_status":"1","purchase_status":"1","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"34","game_id":"25","winner_price":"8000","winning_position":"2nd","lottery_no":"PB101500","lottery_number":"PB101500","user_id":"45","book_status":"1","purchase_status":"1","user_name":"Rohan ","email":"","mobile":"7828876951","password":"","api_key":"","referral_code":"4e8175cec340","referred_by":"","security_pin":"3613","image":"3239870587823406700.jpg","wallet_balance":"0","hold_amount":"0","last_update":"2023-11-24 10:19:51","insert_date":"2023-11-24 13:40:25","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"38","game_id":"25","winner_price":"7000","winning_position":"3rd","lottery_no":"PB101900","lottery_number":"PB101900","user_id":"39","book_status":"1","purchase_status":"0","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"1"}]}

class GetResultModel {
  GetResultModel({
      String? msg, 
      Data? data,}){
    _msg = msg;
    _data = data;
}

  GetResultModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  Data? _data;
GetResultModel copyWith({  String? msg,
  Data? data,
}) => GetResultModel(  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get msg => _msg;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// name : "Matka Lottery"
/// lotteries : [{"game_id":"24","game_name":"Matka Lottery","game_name_hindi":"","open_time":"02:00 PM","open_time_sort":"00:00:00","close_time":"06:30 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-24","result_date":"2023-11-27","result_time":"12:12","ticket_price":"500","image":"https://developmentalphawizz.com/lottery/assets/images/1700829485alpha_giftnew_logo.png","lottery_number":"","winners":[{"id":"22","game_id":"24","winner_price":"100000","winning_position":"1st","lottery_no":"PB101","lottery_number":"PB101","user_id":"39","book_status":"1","purchase_status":"1","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"25","game_id":"24","winner_price":"80000","winning_position":"2nd","lottery_no":"PB104","lottery_number":"PB104","user_id":"6","book_status":"1","purchase_status":"1","user_name":"Sunil","email":"","mobile":"8888647482","password":"e10adc3949ba59abbe56e057f20f883e","api_key":"","referral_code":"","referred_by":"","security_pin":"9992","image":"uploads/img/user/user.png","wallet_balance":"13000","hold_amount":"0","last_update":"2023-10-20 19:38:39","insert_date":"2023-11-24 12:54:24","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"27","game_id":"24","winner_price":"50000","winning_position":"3rd","lottery_no":"PB106","lottery_number":"PB106","user_id":"21","book_status":"1","purchase_status":"1","user_name":"Surendra","email":"","mobile":"9999999999","password":"","api_key":"","referral_code":"2675db01c965","referred_by":"","security_pin":"3053","image":"user.png","wallet_balance":"0","hold_amount":"0","last_update":"2023-11-08 17:16:25","insert_date":"2023-11-23 16:05:24","status":"1","verified":"0","betting_status":"0","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"1"},{"game_id":"25","game_name":"Matka Lottery","game_name_hindi":"","open_time":"11:11 AM","open_time_sort":"00:00:00","close_time":"12:12 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-25","result_date":"2023-11-30","result_time":"12:12","ticket_price":"20","image":"https://developmentalphawizz.com/lottery/assets/images/","lottery_number":"","winners":[{"id":"30","game_id":"25","winner_price":"11110","winning_position":"1st","lottery_no":"PB101000","lottery_number":"PB101000","user_id":"39","book_status":"1","purchase_status":"1","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"34","game_id":"25","winner_price":"8000","winning_position":"2nd","lottery_no":"PB101500","lottery_number":"PB101500","user_id":"45","book_status":"1","purchase_status":"1","user_name":"Rohan ","email":"","mobile":"7828876951","password":"","api_key":"","referral_code":"4e8175cec340","referred_by":"","security_pin":"3613","image":"3239870587823406700.jpg","wallet_balance":"0","hold_amount":"0","last_update":"2023-11-24 10:19:51","insert_date":"2023-11-24 13:40:25","status":"1","verified":"1","betting_status":"0","notification_status":"1","transfer_point_status":"0"},{"id":"38","game_id":"25","winner_price":"7000","winning_position":"3rd","lottery_no":"PB101900","lottery_number":"PB101900","user_id":"39","book_status":"1","purchase_status":"0","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"}],"user_count":"0","active":"1"}]

class Data {
  Data({
      String? name, 
      List<Lotteries>? lotteries,}){
    _name = name;
    _lotteries = lotteries;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    if (json['lotteries'] != null) {
      _lotteries = [];
      json['lotteries'].forEach((v) {
        _lotteries?.add(Lotteries.fromJson(v));
      });
    }
  }
  String? _name;
  List<Lotteries>? _lotteries;
Data copyWith({  String? name,
  List<Lotteries>? lotteries,
}) => Data(  name: name ?? _name,
  lotteries: lotteries ?? _lotteries,
);
  String? get name => _name;
  List<Lotteries>? get lotteries => _lotteries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_lotteries != null) {
      map['lotteries'] = _lotteries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// game_id : "24"
/// game_name : "Matka Lottery"
/// game_name_hindi : ""
/// open_time : "02:00 PM"
/// open_time_sort : "00:00:00"
/// close_time : "06:30 PM"
/// status : "1"
/// result_status : "1"
/// market_status : "1"
/// market_off_day : ""
/// date : "2023-11-22"
/// end_date : "2023-11-24"
/// result_date : "2023-11-27"
/// result_time : "12:12"
/// ticket_price : "500"
/// image : "https://developmentalphawizz.com/lottery/assets/images/1700829485alpha_giftnew_logo.png"
/// lottery_number : ""
/// winners : [{"id":"22","game_id":"24","winner_price":"100000","winning_position":"1st","lottery_no":"PB101","lottery_number":"PB101","user_id":"39","book_status":"1","purchase_status":"1","user_name":"Som Rajpoot ","email":"","mobile":"6363636363","password":"","api_key":"","referral_code":"6cec52b32921","referred_by":"","security_pin":"9581","image":"2199753295952965298.jpg","wallet_balance":"93","hold_amount":"7","last_update":"2023-11-21 15:01:43","insert_date":"2023-11-24 18:22:50","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"25","game_id":"24","winner_price":"80000","winning_position":"2nd","lottery_no":"PB104","lottery_number":"PB104","user_id":"6","book_status":"1","purchase_status":"1","user_name":"Sunil","email":"","mobile":"8888647482","password":"e10adc3949ba59abbe56e057f20f883e","api_key":"","referral_code":"","referred_by":"","security_pin":"9992","image":"uploads/img/user/user.png","wallet_balance":"13000","hold_amount":"0","last_update":"2023-10-20 19:38:39","insert_date":"2023-11-24 12:54:24","status":"1","verified":"1","betting_status":"1","notification_status":"1","transfer_point_status":"0"},{"id":"27","game_id":"24","winner_price":"50000","winning_position":"3rd","lottery_no":"PB106","lottery_number":"PB106","user_id":"21","book_status":"1","purchase_status":"1","user_name":"Surendra","email":"","mobile":"9999999999","password":"","api_key":"","referral_code":"2675db01c965","referred_by":"","security_pin":"3053","image":"user.png","wallet_balance":"0","hold_amount":"0","last_update":"2023-11-08 17:16:25","insert_date":"2023-11-23 16:05:24","status":"1","verified":"0","betting_status":"0","notification_status":"1","transfer_point_status":"0"}]
/// user_count : "0"
/// active : "1"

class Lotteries {
  Lotteries({
      String? gameId, 
      String? gameName, 
      String? gameNameHindi, 
      String? openTime, 
      String? openTimeSort, 
      String? closeTime, 
      String? status, 
      String? resultStatus, 
      String? marketStatus, 
      String? marketOffDay, 
      String? date, 
      String? endDate, 
      String? resultDate, 
      String? resultTime, 
      String? ticketPrice, 
      String? image, 
      String? lotteryNumber, 
      List<Winners>? winners, 
      String? userCount, 
      String? active,}){
    _gameId = gameId;
    _gameName = gameName;
    _gameNameHindi = gameNameHindi;
    _openTime = openTime;
    _openTimeSort = openTimeSort;
    _closeTime = closeTime;
    _status = status;
    _resultStatus = resultStatus;
    _marketStatus = marketStatus;
    _marketOffDay = marketOffDay;
    _date = date;
    _endDate = endDate;
    _resultDate = resultDate;
    _resultTime = resultTime;
    _ticketPrice = ticketPrice;
    _image = image;
    _lotteryNumber = lotteryNumber;
    _winners = winners;
    _userCount = userCount;
    _active = active;
}

  Lotteries.fromJson(dynamic json) {
    _gameId = json['game_id'];
    _gameName = json['game_name'];
    _gameNameHindi = json['game_name_hindi'];
    _openTime = json['open_time'];
    _openTimeSort = json['open_time_sort'];
    _closeTime = json['close_time'];
    _status = json['status'];
    _resultStatus = json['result_status'];
    _marketStatus = json['market_status'];
    _marketOffDay = json['market_off_day'];
    _date = json['date'];
    _endDate = json['end_date'];
    _resultDate = json['result_date'];
    _resultTime = json['result_time'];
    _ticketPrice = json['ticket_price'];
    _image = json['image'];
    _lotteryNumber = json['lottery_number'];
    if (json['winners'] != null) {
      _winners = [];
      json['winners'].forEach((v) {
        _winners?.add(Winners.fromJson(v));
      });
    }
    _userCount = json['user_count'];
    _active = json['active'];
  }
  String? _gameId;
  String? _gameName;
  String? _gameNameHindi;
  String? _openTime;
  String? _openTimeSort;
  String? _closeTime;
  String? _status;
  String? _resultStatus;
  String? _marketStatus;
  String? _marketOffDay;
  String? _date;
  String? _endDate;
  String? _resultDate;
  String? _resultTime;
  String? _ticketPrice;
  String? _image;
  String? _lotteryNumber;
  List<Winners>? _winners;
  String? _userCount;
  String? _active;
Lotteries copyWith({  String? gameId,
  String? gameName,
  String? gameNameHindi,
  String? openTime,
  String? openTimeSort,
  String? closeTime,
  String? status,
  String? resultStatus,
  String? marketStatus,
  String? marketOffDay,
  String? date,
  String? endDate,
  String? resultDate,
  String? resultTime,
  String? ticketPrice,
  String? image,
  String? lotteryNumber,
  List<Winners>? winners,
  String? userCount,
  String? active,
}) => Lotteries(  gameId: gameId ?? _gameId,
  gameName: gameName ?? _gameName,
  gameNameHindi: gameNameHindi ?? _gameNameHindi,
  openTime: openTime ?? _openTime,
  openTimeSort: openTimeSort ?? _openTimeSort,
  closeTime: closeTime ?? _closeTime,
  status: status ?? _status,
  resultStatus: resultStatus ?? _resultStatus,
  marketStatus: marketStatus ?? _marketStatus,
  marketOffDay: marketOffDay ?? _marketOffDay,
  date: date ?? _date,
  endDate: endDate ?? _endDate,
  resultDate: resultDate ?? _resultDate,
  resultTime: resultTime ?? _resultTime,
  ticketPrice: ticketPrice ?? _ticketPrice,
  image: image ?? _image,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
  winners: winners ?? _winners,
  userCount: userCount ?? _userCount,
  active: active ?? _active,
);
  String? get gameId => _gameId;
  String? get gameName => _gameName;
  String? get gameNameHindi => _gameNameHindi;
  String? get openTime => _openTime;
  String? get openTimeSort => _openTimeSort;
  String? get closeTime => _closeTime;
  String? get status => _status;
  String? get resultStatus => _resultStatus;
  String? get marketStatus => _marketStatus;
  String? get marketOffDay => _marketOffDay;
  String? get date => _date;
  String? get endDate => _endDate;
  String? get resultDate => _resultDate;
  String? get resultTime => _resultTime;
  String? get ticketPrice => _ticketPrice;
  String? get image => _image;
  String? get lotteryNumber => _lotteryNumber;
  List<Winners>? get winners => _winners;
  String? get userCount => _userCount;
  String? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['game_id'] = _gameId;
    map['game_name'] = _gameName;
    map['game_name_hindi'] = _gameNameHindi;
    map['open_time'] = _openTime;
    map['open_time_sort'] = _openTimeSort;
    map['close_time'] = _closeTime;
    map['status'] = _status;
    map['result_status'] = _resultStatus;
    map['market_status'] = _marketStatus;
    map['market_off_day'] = _marketOffDay;
    map['date'] = _date;
    map['end_date'] = _endDate;
    map['result_date'] = _resultDate;
    map['result_time'] = _resultTime;
    map['ticket_price'] = _ticketPrice;
    map['image'] = _image;
    map['lottery_number'] = _lotteryNumber;
    if (_winners != null) {
      map['winners'] = _winners?.map((v) => v.toJson()).toList();
    }
    map['user_count'] = _userCount;
    map['active'] = _active;
    return map;
  }

}

/// id : "22"
/// game_id : "24"
/// winner_price : "100000"
/// winning_position : "1st"
/// lottery_no : "PB101"
/// lottery_number : "PB101"
/// user_id : "39"
/// book_status : "1"
/// purchase_status : "1"
/// user_name : "Som Rajpoot "
/// email : ""
/// mobile : "6363636363"
/// password : ""
/// api_key : ""
/// referral_code : "6cec52b32921"
/// referred_by : ""
/// security_pin : "9581"
/// image : "2199753295952965298.jpg"
/// wallet_balance : "93"
/// hold_amount : "7"
/// last_update : "2023-11-21 15:01:43"
/// insert_date : "2023-11-24 18:22:50"
/// status : "1"
/// verified : "1"
/// betting_status : "1"
/// notification_status : "1"
/// transfer_point_status : "0"

class Winners {
  Winners({
      String? id, 
      String? gameId, 
      String? winnerPrice, 
      String? winningPosition, 
      String? lotteryNo, 
      String? lotteryNumber, 
      String? userId, 
      String? bookStatus, 
      String? purchaseStatus, 
      String? userName, 
      String? email, 
      String? mobile, 
      String? password, 
      String? apiKey, 
      String? referralCode, 
      String? referredBy, 
      String? securityPin, 
      String? image, 
      String? walletBalance, 
      String? holdAmount, 
      String? lastUpdate, 
      String? insertDate, 
      String? status, 
      String? verified, 
      String? bettingStatus, 
      String? notificationStatus, 
      String? transferPointStatus,}){
    _id = id;
    _gameId = gameId;
    _winnerPrice = winnerPrice;
    _winningPosition = winningPosition;
    _lotteryNo = lotteryNo;
    _lotteryNumber = lotteryNumber;
    _userId = userId;
    _bookStatus = bookStatus;
    _purchaseStatus = purchaseStatus;
    _userName = userName;
    _email = email;
    _mobile = mobile;
    _password = password;
    _apiKey = apiKey;
    _referralCode = referralCode;
    _referredBy = referredBy;
    _securityPin = securityPin;
    _image = image;
    _walletBalance = walletBalance;
    _holdAmount = holdAmount;
    _lastUpdate = lastUpdate;
    _insertDate = insertDate;
    _status = status;
    _verified = verified;
    _bettingStatus = bettingStatus;
    _notificationStatus = notificationStatus;
    _transferPointStatus = transferPointStatus;
}

  Winners.fromJson(dynamic json) {
    _id = json['id'];
    _gameId = json['game_id'];
    _winnerPrice = json['winner_price'];
    _winningPosition = json['winning_position'];
    _lotteryNo = json['lottery_no'];
    _lotteryNumber = json['lottery_number'];
    _userId = json['user_id'];
    _bookStatus = json['book_status'];
    _purchaseStatus = json['purchase_status'];
    _userName = json['user_name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _apiKey = json['api_key'];
    _referralCode = json['referral_code'];
    _referredBy = json['referred_by'];
    _securityPin = json['security_pin'];
    _image = json['image'];
    _walletBalance = json['wallet_balance'];
    _holdAmount = json['hold_amount'];
    _lastUpdate = json['last_update'];
    _insertDate = json['insert_date'];
    _status = json['status'];
    _verified = json['verified'];
    _bettingStatus = json['betting_status'];
    _notificationStatus = json['notification_status'];
    _transferPointStatus = json['transfer_point_status'];
  }
  String? _id;
  String? _gameId;
  String? _winnerPrice;
  String? _winningPosition;
  String? _lotteryNo;
  String? _lotteryNumber;
  String? _userId;
  String? _bookStatus;
  String? _purchaseStatus;
  String? _userName;
  String? _email;
  String? _mobile;
  String? _password;
  String? _apiKey;
  String? _referralCode;
  String? _referredBy;
  String? _securityPin;
  String? _image;
  String? _walletBalance;
  String? _holdAmount;
  String? _lastUpdate;
  String? _insertDate;
  String? _status;
  String? _verified;
  String? _bettingStatus;
  String? _notificationStatus;
  String? _transferPointStatus;
Winners copyWith({  String? id,
  String? gameId,
  String? winnerPrice,
  String? winningPosition,
  String? lotteryNo,
  String? lotteryNumber,
  String? userId,
  String? bookStatus,
  String? purchaseStatus,
  String? userName,
  String? email,
  String? mobile,
  String? password,
  String? apiKey,
  String? referralCode,
  String? referredBy,
  String? securityPin,
  String? image,
  String? walletBalance,
  String? holdAmount,
  String? lastUpdate,
  String? insertDate,
  String? status,
  String? verified,
  String? bettingStatus,
  String? notificationStatus,
  String? transferPointStatus,
}) => Winners(  id: id ?? _id,
  gameId: gameId ?? _gameId,
  winnerPrice: winnerPrice ?? _winnerPrice,
  winningPosition: winningPosition ?? _winningPosition,
  lotteryNo: lotteryNo ?? _lotteryNo,
  lotteryNumber: lotteryNumber ?? _lotteryNumber,
  userId: userId ?? _userId,
  bookStatus: bookStatus ?? _bookStatus,
  purchaseStatus: purchaseStatus ?? _purchaseStatus,
  userName: userName ?? _userName,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  apiKey: apiKey ?? _apiKey,
  referralCode: referralCode ?? _referralCode,
  referredBy: referredBy ?? _referredBy,
  securityPin: securityPin ?? _securityPin,
  image: image ?? _image,
  walletBalance: walletBalance ?? _walletBalance,
  holdAmount: holdAmount ?? _holdAmount,
  lastUpdate: lastUpdate ?? _lastUpdate,
  insertDate: insertDate ?? _insertDate,
  status: status ?? _status,
  verified: verified ?? _verified,
  bettingStatus: bettingStatus ?? _bettingStatus,
  notificationStatus: notificationStatus ?? _notificationStatus,
  transferPointStatus: transferPointStatus ?? _transferPointStatus,
);
  String? get id => _id;
  String? get gameId => _gameId;
  String? get winnerPrice => _winnerPrice;
  String? get winningPosition => _winningPosition;
  String? get lotteryNo => _lotteryNo;
  String? get lotteryNumber => _lotteryNumber;
  String? get userId => _userId;
  String? get bookStatus => _bookStatus;
  String? get purchaseStatus => _purchaseStatus;
  String? get userName => _userName;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get apiKey => _apiKey;
  String? get referralCode => _referralCode;
  String? get referredBy => _referredBy;
  String? get securityPin => _securityPin;
  String? get image => _image;
  String? get walletBalance => _walletBalance;
  String? get holdAmount => _holdAmount;
  String? get lastUpdate => _lastUpdate;
  String? get insertDate => _insertDate;
  String? get status => _status;
  String? get verified => _verified;
  String? get bettingStatus => _bettingStatus;
  String? get notificationStatus => _notificationStatus;
  String? get transferPointStatus => _transferPointStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['game_id'] = _gameId;
    map['winner_price'] = _winnerPrice;
    map['winning_position'] = _winningPosition;
    map['lottery_no'] = _lotteryNo;
    map['lottery_number'] = _lotteryNumber;
    map['user_id'] = _userId;
    map['book_status'] = _bookStatus;
    map['purchase_status'] = _purchaseStatus;
    map['user_name'] = _userName;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['api_key'] = _apiKey;
    map['referral_code'] = _referralCode;
    map['referred_by'] = _referredBy;
    map['security_pin'] = _securityPin;
    map['image'] = _image;
    map['wallet_balance'] = _walletBalance;
    map['hold_amount'] = _holdAmount;
    map['last_update'] = _lastUpdate;
    map['insert_date'] = _insertDate;
    map['status'] = _status;
    map['verified'] = _verified;
    map['betting_status'] = _bettingStatus;
    map['notification_status'] = _notificationStatus;
    map['transfer_point_status'] = _transferPointStatus;
    return map;
  }

}