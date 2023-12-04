/// msg : "Lotteries list."
/// data : {"name":"Matka Lottery","lotteries":[{"game_id":"24","game_name":"Matka Lottery","game_name_hindi":"","open_time":"02:00 PM","open_time_sort":"00:00:00","close_time":"06:30 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-24","result_date":"2023-11-27","result_time":"12:12","ticket_price":"500","image":"https://developmentalphawizz.com/lottery/assets/images/1700829485alpha_giftnew_logo.png","lottery_number":"","user_count":"0","active":"1"},{"game_id":"25","game_name":"Matka Lottery","game_name_hindi":"","open_time":"11:11 AM","open_time_sort":"00:00:00","close_time":"12:12 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-25","result_date":"2023-11-30","result_time":"12:12","ticket_price":"20","image":"https://developmentalphawizz.com/lottery/assets/images/","lottery_number":"","user_count":"0","active":"1"}]}

class MyLotteryModel {
  MyLotteryModel({
      String? msg, 
      Data? data,}){
    _msg = msg;
    _data = data;
}

  MyLotteryModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  Data? _data;
MyLotteryModel copyWith({  String? msg,
  Data? data,
}) => MyLotteryModel(  msg: msg ?? _msg,
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
/// lotteries : [{"game_id":"24","game_name":"Matka Lottery","game_name_hindi":"","open_time":"02:00 PM","open_time_sort":"00:00:00","close_time":"06:30 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-24","result_date":"2023-11-27","result_time":"12:12","ticket_price":"500","image":"https://developmentalphawizz.com/lottery/assets/images/1700829485alpha_giftnew_logo.png","lottery_number":"","user_count":"0","active":"1"},{"game_id":"25","game_name":"Matka Lottery","game_name_hindi":"","open_time":"11:11 AM","open_time_sort":"00:00:00","close_time":"12:12 PM","status":"1","result_status":"1","market_status":"1","market_off_day":"","date":"2023-11-22","end_date":"2023-11-25","result_date":"2023-11-30","result_time":"12:12","ticket_price":"20","image":"https://developmentalphawizz.com/lottery/assets/images/","lottery_number":"","user_count":"0","active":"1"}]

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
    map['user_count'] = _userCount;
    map['active'] = _active;
    return map;
  }

}