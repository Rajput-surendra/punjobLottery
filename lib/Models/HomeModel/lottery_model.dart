class LotteryModel {
  String? msg;
  Data? data;

  LotteryModel({this.msg, this.data});

  LotteryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  List<Lotteries>? lotteries;

  Data({this.name, this.lotteries});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['lotteries'] != null) {
      lotteries = <Lotteries>[];
      json['lotteries'].forEach((v) {
        lotteries!.add(new Lotteries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.lotteries != null) {
      data['lotteries'] = this.lotteries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lotteries {
  String? gameId;
  String? gameName;
  String? gameNameHindi;
  String? openTime;
  String? openTimeSort;
  String? closeTime;
  String? status;
  String? marketStatus;
  String? marketOffDay;
  String? date;
  String? endDate;
  String? resultDate;
  String? ticketPrice;
  String? image;
  String? lotteryNumber;
  String? userCount;
  String? active;

  Lotteries(
      {this.gameId,
        this.gameName,
        this.gameNameHindi,
        this.openTime,
        this.openTimeSort,
        this.closeTime,
        this.status,
        this.marketStatus,
        this.marketOffDay,
        this.date,
        this.endDate,
        this.resultDate,
        this.ticketPrice,
        this.image,
        this.lotteryNumber,
        this.userCount,
        this.active});

  Lotteries.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    gameName = json['game_name'];
    gameNameHindi = json['game_name_hindi'];
    openTime = json['open_time'];
    openTimeSort = json['open_time_sort'];
    closeTime = json['close_time'];
    status = json['status'];
    marketStatus = json['market_status'];
    marketOffDay = json['market_off_day'];
    date = json['date'];
    endDate = json['end_date'];
    resultDate = json['result_date'];
    ticketPrice = json['ticket_price'];
    image = json['image'];
    lotteryNumber = json['lottery_number'];
    userCount = json['user_count'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    data['game_name'] = this.gameName;
    data['game_name_hindi'] = this.gameNameHindi;
    data['open_time'] = this.openTime;
    data['open_time_sort'] = this.openTimeSort;
    data['close_time'] = this.closeTime;
    data['status'] = this.status;
    data['market_status'] = this.marketStatus;
    data['market_off_day'] = this.marketOffDay;
    data['date'] = this.date;
    data['end_date'] = this.endDate;
    data['result_date'] = this.resultDate;
    data['ticket_price'] = this.ticketPrice;
    data['image'] = this.image;
    data['lottery_number'] = this.lotteryNumber;
    data['user_count'] = this.userCount;
    data['active'] = this.active;
    return data;
  }
}
