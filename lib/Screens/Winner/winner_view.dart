import 'dart:async';
import 'dart:convert';

import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/custom_clip_path.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Models/HomeModel/lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import 'package:http/http.dart' as http;

class WinnerScreen extends StatefulWidget {
  WinnerScreen({Key? key, this.isFrom, this.gId}) : super(key: key);
  final bool? isFrom;
  String? gId;

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  var result = '';

  @override
  void initState() {
    super.initState();

    getLottery();
  }

  int _counter = 60;
  late Timer _timer;

  int _counter1 = 4;
  late Timer _timer1;

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  bool isFirst = true;
  var amount = 0;
  String? purchase;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomSheet: Container(
            height: 82,
            color: AppColors.whit,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Divider(
                      color: AppColors.fntClr,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Balance:",
                                style: TextStyle(color: AppColors.fntClr)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "₹ ${lotteryDetailsModel?.data?.lottery?.walletBalance}",
                              style: const TextStyle(color: AppColors.profileColor),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                if(purchase == '1'){
                                  Fluttertoast.showToast(msg: "All ready buy!!");
                                }else{
                                  buyLotteryApi();
                                }

                                //addTikitList();
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: RadialGradient(
                                      radius: 1.2,
                                      colors: [
                                        AppColors.primary,
                                        AppColors.secondary
                                      ]),
                                ),
                                child: Center(
                                    child: Text(
                                  amount == 0 ? "BUY" : "Buy ₹ $amount ",
                                  style: const TextStyle(color: AppColors.whit),
                                )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          backgroundColor: AppColors.whit,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50),
              ),
            ),
            toolbarHeight: 60,
            centerTitle: true,
            title: const Text(
              "Winner",
              style: TextStyle(fontSize: 17),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10),
                ),
                gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.1,
                    colors: <Color>[AppColors.primary, AppColors.secondary]),
              ),
            ),
          ),
          body: lotteryDetailsModel?.data?.lottery == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Timer",
                              style: TextStyle(
                                  color: AppColors.fntClr,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("$_counter1 : $_counter"),
                            )),
                          ],
                        ),

                        //SizedBox(height: 20,),
                        Container(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: lotteryDetailsModel!.data!.lottery!
                                  .winningPositionHistory!.length,
                              // itemCount:2,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    //Get.toNamed(winnerScreen,arguments:lotteryModel?.data?.lotteries?[index].gameId );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        // height: 50,
                                        width: 160,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/winningOrice.png"),
                                                fit: BoxFit.fill)),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Text(
                                                "${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winningPosition}",
                                                style: const TextStyle(
                                                    color: AppColors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              "Winner Price ",
                                              style: TextStyle(
                                                  color: AppColors.whit,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "₹${lotteryDetailsModel!.data!.lottery!.winningPositionHistory![index].winnerPrice}",
                                              style: const TextStyle(
                                                  color: AppColors.whit,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          color: AppColors.lotteryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Lottery Price",
                                          style: TextStyle(
                                              color: AppColors.fntClr,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "(₹${lotteryDetailsModel!.data!.lottery!.ticketPrice})",
                                          style: const TextStyle(
                                              color: AppColors.fntClr,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Open: ${lotteryDetailsModel!.data!.lottery!.openTime}"),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            "Close ${lotteryDetailsModel!.data!.lottery!.closeTime}"),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.1,
                                  child: GridView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            // Number of columns in the grid
                                            childAspectRatio: 8 / 4),
                                    itemCount: lotteryDetailsModel!
                                        .data!.lottery!.lotteryNumbers!.length,
                                    itemBuilder: (context, index) {
                                      purchase =
                                          lotteryDetailsModel!
                                              .data!
                                              .lottery
                                              ?.lotteryNumbers?[index]
                                              .purchaseStatus;
                                      String? bookingStatus =
                                          lotteryDetailsModel!
                                              .data!
                                              .lottery
                                              ?.lotteryNumbers?[index]
                                              .bookStatus;
                                      String? bookedUser = lotteryDetailsModel!
                                          .data!
                                          .lottery
                                          ?.lotteryNumbers?[index]
                                          .userId;
                                      String? lotteryNum = lotteryDetailsModel!
                                          .data!
                                          .lottery!
                                          .lotteryNumbers![index]
                                          .lotteryNumber;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isFirst) {
                                              _timer = Timer.periodic(
                                                  const Duration(seconds: 1),
                                                  (timer) {
                                                setState(() {
                                                  _counter--;
                                                });
                                                if (_counter == 0) {
                                                  if (!_timer1.isActive) {
                                                    _timer.cancel();
                                                  } else {
                                                    _counter = 60;
                                                  }
                                                }
                                              });
                                              _timer1 = Timer.periodic(
                                                  const Duration(minutes: 1),
                                                  (timer) {
                                                setState(() {
                                                  _counter1--;
                                                });
                                                if (_counter1 == 0) {
                                                  _timer1.cancel();
                                                }
                                              });
                                            }
                                            if (bookingStatus == "0") {
                                              if (selectedCardIndexes
                                                  .contains(index)) {
                                                setState(() {

                                                });
                                                cardData.remove(lotteryNum);
                                                amount -= int.parse(
                                                    lotteryDetailsModel!.data!
                                                        .lottery!.ticketPrice!);
                                                bookLotteryNumberApi(
                                                    lotteryNum!, false);
                                                selectedCardIndexes
                                                    .remove(index);
                                              } else {
                                                setState(() {

                                                });
                                                bookLotteryNumberApi(
                                                    lotteryNum!, true);
                                                cardData.add(lotteryNum);

                                                amount += int.parse(
                                                    lotteryDetailsModel!
                                                            .data!
                                                            .lottery!
                                                            .ticketPrice ??
                                                        "0");
                                                selectedCardIndexes.add(index);
                                              }
                                            } else if (bookingStatus == "1" &&
                                                userId != bookedUser) {
                                              Fluttertoast.showToast(
                                                  msg: "Already Booked");
                                            } else {
                                              setState(() {
                                                cardData.remove(lotteryNum);
                                                // amount -= int.parse(
                                                //     lotteryDetailsModel!.data!
                                                //         .lottery!.ticketPrice!);
                                                bookLotteryNumberApi(
                                                    lotteryNum!, false);
                                                selectedCardIndexes
                                                    .remove(index);
                                              });

                                            }
                                          });
                                          isFirst = false;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(5)),
                                              border: Border.all(
                                                  color: AppColors.fntClr),
                                              color: bookingStatus == "1" &&
                                                      userId != bookedUser
                                                  ? AppColors.greyColor
                                                  : selectedCardIndexes
                                                  .contains(index)
                                                      ? AppColors.secondary
                                                      : bookingStatus == '1'
                                                              ? AppColors
                                                                  .secondary
                                                              : AppColors.whit,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${lotteryDetailsModel!.data!.lottery?.lotteryNumbers?[index].lotteryNumber}",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: selectedCardIndexes
                                                              .contains(
                                                                  index) ||
                                                          lotteryDetailsModel!
                                                                  .data!
                                                                  .lottery
                                                                  ?.lotteryNumbers?[
                                                                      index]
                                                                  .bookStatus ==
                                                              "1"
                                                      ? AppColors.whit
                                                      : null,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  List<int> selectedCardIndexes = [];
  List<String> cardData = [];

  void addTikitList() {
    // for(int i =0; i<cardData.length;i++){
    //   if(i==0){
    //     result = result + cardData[i];
    //   }else{
    //     result = "$result, ${cardData[i]}";
    //  }
    // }
    print(cardData.toString());
  }

  LotteryListModel? lotteryDetailsModel;

//   Future<void> getLottery() async {
//     // isLoading.value = true;
//     var param = {
//       'game_id':widget.gId
//     };
// print('______param____${param}_________');
//     apiBaseHelper.postAPICall(getLotteryAPI, param).then((getData) {
//       print('____surendra______${getData}_________');
//       String msg = getData['msg'];
//       lotteryDetailsModel = LotteryListModel.fromJson(getData);
//       Fluttertoast.showToast(msg: msg);
//       //isLoading.value = false;
//     });
//   }
  String? userId;

  getLottery() async {
    userId = await SharedPre.getStringValue('userId');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=18afbdd33b04ace40a80944d83e9e23e3ab91c3e'
    };
    var request =
        http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getLottery'));
    request.body = json.encode({"game_id": widget.gId, "user_id": userId});
    print('_____request.body_____${request.body}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = LotteryListModel.fromJson(json.decode(result));
      Fluttertoast.showToast(msg: "${finalResult.msg}");
      setState(() {
        lotteryDetailsModel = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  buyLotteryApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=b573cdbddfc5117759d47585dfc702de3f6f0cc9'
    };
    var request =
        http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/buyLottery'));
    request.body = json.encode({
      "user_id": userId,
      "game_id": widget.gId,
      "amount": amount,
      "lottery_numbers": cardData,
      "order_number": "2675db01c965",
      "txn_id": "2675db01c965ijbdhgd"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      Fluttertoast.showToast(msg: "${jsonResponse['msg']}");
      Navigator.pop(context);
    } else {
      print(response.reasonPhrase);
    }
  }

  bookLotteryNumberApi(String lottery, status) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=c409297463ece9a50b186ed0d83573aa184203a2'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseUrl1/Apicontroller/bookLotteryNumber'));
    request.body = json.encode({
      "game_id": widget.gId,
      "user_id": userId,
      "lottery_number": lottery,
      "select": status
    });
    print('______request.body____${request.body}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = json.decode(result);
      Fluttertoast.showToast(msg: "${finalResult['msg']}");
    } else {
      print(response.reasonPhrase);
    }
  }
}
