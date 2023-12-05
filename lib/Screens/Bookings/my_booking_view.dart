import 'dart:convert';

import 'package:booknplay/Screens/Bookings/my_booking_controller.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/my_lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import 'package:http/http.dart'as http;

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({Key? key, this.isFrom}) : super(key: key);
final bool? isFrom ;

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whit,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
            bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
          ),),
        toolbarHeight: 60,
        centerTitle: true,
        title: Text("My Lotteries",style: TextStyle(fontSize: 17),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius:   BorderRadius.only(
              bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10),),
            gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.1,
                colors: <Color>[AppColors.primary, AppColors.secondary]),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(2.0),
          child:RefreshIndicator(
            onRefresh: (){
              return Future.delayed(Duration(seconds: 2), () {
                get();
              });

            },
            child: Container(
              height: MediaQuery.of(context).size.height/1.0,
              child: ListView.builder(
                    itemCount: 1,
                  itemBuilder: (context,i){
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              //height: MediaQuery.of(context).size.height/1.1,
                              child:myLotteryModel == null ? Center(child: Text(" No Lottery Found!!")): ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:myLotteryModel!.data!.lotteries!.length ,
                                  // itemCount:2,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                            height: 90,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage("assets/images/myLotterybooking.png"), fit: BoxFit.fill)),
                                            child:  Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5,right: 5),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("Result Date :",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          Text("${myLotteryModel!.data!.lotteries![index].resultDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(height: 25,),
                                                          Text("Result Time:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          myLotteryModel!.data!.lotteries![index].resultTime == null ? Text("") :   Text("${myLotteryModel!.data!.lotteries![index].resultTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("${myLotteryModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(height: 3,),
                                                          Text("Price : ${myLotteryModel!.data!.lotteries![index].ticketPrice}",style: TextStyle(color: AppColors.whit,fontSize: 18),),

                                                        ],
                                                      ),

                                                      // myLotteryModel?.data?.lotteries?[index].active == '0' ? SizedBox.shrink():  Text("Betting is Running Now",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                      Container(
                                                        height: 45,width: 50,
                                                        child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child: Image.network("${myLotteryModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            )
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                );
              }),
            ),
          )
        ),
      )
    ) ;
  }

  MyLotteryModel? myLotteryModel;
  // Future<void> getLottery() async {
  //   // isLoading.value = true;
  //   var param = {
  //     'user_id':userId
  //   };
  //   apiBaseHelper.postAPICall(getLotteryAPI, param).then((getData) {
  //     String msg = getData['msg'];
  //     myLotteryModel = MyLotteryModel.fromJson(getData);
  //     setState(() {
  //
  //     });
  //     Fluttertoast.showToast(msg: msg);
  //
  //     //isLoading.value = false;
  //   });
  // }



  getLottery() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=cefaa9477065503c4ca2ed67af58f3c87c6bfab4'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getLotteries'));
    request.body = json.encode({
      // "referred_by":userReferCode
      'user_id':userId
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = MyLotteryModel.fromJson(json.decode(result));
      setState(() {
        myLotteryModel = finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");

    }
    else {
      print(response.reasonPhrase);
    }

  }


  get() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=4b8b6274f26a280877c08cfedab1d6e9b46e4d2d'
    };
    var request = http.Request('POST', Uri.parse('https://developmentalphawizz.com/lottery/Apicontroller/getLotteries'));
    request.body = json.encode({
      "user_id":userId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
     var result = await response.stream.bytesToString();
     var finalResult = MyLotteryModel.fromJson(jsonDecode(result));
     setState(() {
       myLotteryModel = finalResult;
     });
     Fluttertoast.showToast(msg: "${finalResult.msg}");
    }
    else {
    print(response.reasonPhrase);
    }

  }
}
