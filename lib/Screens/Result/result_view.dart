import 'dart:convert';

import 'package:booknplay/Constants.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Screens/Result/result_detaits_view.dart';
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
import 'package:intl/intl.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_result_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import 'package:http/http.dart'as http;

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, this.isFrom}) : super(key: key);
  final bool? isFrom;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: Text("Result",style: TextStyle(fontSize: 17,color: AppColors.whit),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius:   BorderRadius.only(
                bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10),),
             color:AppColors.secondary
              // gradient: RadialGradient(
              //     center: Alignment.center,
              //     radius: 1.1,
              //     colors: <Color>[AppColors.primary, AppColors.secondary]),
            ),
          ),
        ),
        body:  SingleChildScrollView(
          child: Padding(
              padding:  EdgeInsets.all(2.0),
              child:RefreshIndicator(
                onRefresh: (){
                  return Future.delayed(Duration(seconds: 2), () {
                    getResultDetails();
                  });

                },
                child: Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context,i){
                      //  print('ticket length ${getResultModel!.data!.lotteries!.length}');
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
                                      child:getResultModel == null ? Center(child: CircularProgressIndicator()):getResultModel!.data!.lotteries!.length == 0?
                                      Center(child: Text("No Result found!!!")): ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount:getResultModel!.data!.lotteries!.length ,
                                          // itemCount:2,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultDetailsScreen(gId:getResultModel!.data!.lotteries![index].gameId)));
                                                  },
                                                  child: Container(
                                                      height: 95,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                                        color: AppColors.whit,),
                                                      // decoration: const BoxDecoration(
                                                      //     image: DecorationImage(
                                                      //         image: AssetImage("assets/images/myLotterybooking.png"), fit: BoxFit.fill)),
                                                      child:  Column(
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),color: AppColors.secondary),

                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 8,right:8),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text("Result Date :",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                      SizedBox(width: 2,),

                                                                      Text("${DateFormat('dd MMM yyyy').format(DateTime.parse(getResultModel!.data!.lotteries![index].resultDate ?? ""))}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(height: 25,),
                                                                      Text("Result Time:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                      SizedBox(width: 2,),
                                                                      Text("${getResultModel!.data!.lotteries![index].resultTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                                    ],
                                                                  ),

                                                                ],
                                                              ),
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
                                                                    Text("${getResultModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.black,fontSize: 12),),
                                                                    SizedBox(height: 3,),
                                                                    Text("1st Price : ${getResultModel!.data!.lotteries![0].winners![0].winnerPrice}",style: TextStyle(color: AppColors.black,fontSize: 18),),

                                                                  ],
                                                                ),

                                                                // myLotteryModel?.data?.lotteries?[index].active == '0' ? SizedBox.shrink():  Text("Betting is Running Now",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                                Container(
                                                                  height: 45,width: 50,
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                      child: Image.network("${getResultModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      )
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
  String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    getResultDetails();
  }
  GetResultModel? getResultModel;
  // Future<void> getResultDetails() async {
  //   // isLoading.value = true;
  //   var param = {
  //     'user_id':userId
  //   };
  //   apiBaseHelper.postAPICall(getResultAPI, param).then((getData) {
  //     String msg = getData['msg'];
  //     getResultModel = GetResultModel.fromJson(getData);
  //     setState(() {
  //
  //     });
  //     Fluttertoast.showToast(msg: msg);
  //     //isLoading.value = false;
  //   });
  // }




  getResultDetails() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=4b8b6274f26a280877c08cfedab1d6e9b46e4d2d'
    };
    // var request = http.Request('POST', Uri.parse('https://punjablottery.online/Apicontroller/getResults'));
    // request.body = json.encode({
    //   "user_id":userId
    // });
    var request = http.MultipartRequest('POST', Uri.parse('https://punjablottery.online/Apicontroller/getResults'));
    request.fields.addAll({
      'user_id': userId ?? ""
    });

    // print('____request.body______11${request.body}_________');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetResultModel.fromJson(jsonDecode(result));
      // print('results   ${finalResult.data?.name}');
      setState(() {
        getResultModel = finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");
    }
    else {
      print(response.reasonPhrase);
    }

  }

}
