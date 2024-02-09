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
import '../../Models/HomeModel/get_result_details_model.dart';
import '../../Models/HomeModel/get_result_model.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Models/HomeModel/lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import 'package:http/http.dart'as http;
class WinnerDetailsScreen extends StatefulWidget {
  WinnerDetailsScreen({Key? key, this.isFrom,this.gId}) : super(key: key);
  final bool? isFrom;
  String ? gId;

  @override
  State<WinnerDetailsScreen> createState() => _WinnerDetailsScreenState();
}

class _WinnerDetailsScreenState extends State<WinnerDetailsScreen> {
  var result= '';
  @override
  void initState() {
    super.initState();
   // getResultDetails();
    getInvatation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whit,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
              ),),
            toolbarHeight: 60,
            centerTitle: true,
            title: const Text("Winner List",style: TextStyle(fontSize: 17),),
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
          body: getResultDetailsModel == null ? Center(child: CircularProgressIndicator()):   SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height/1.1,
                child: ListView.builder(
                  itemCount:getResultDetailsModel!.data!.lotteries![0].winners!.length ,
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //   childAspectRatio: 4/1
                  // ),
                  itemBuilder: (context,i) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Winning Position : ${getResultDetailsModel!.data!.lotteries![0].winners![i].winningPosition}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold)),
                                    SizedBox(height: 4,),
                                    Text("Winner Price : ₹${getResultDetailsModel!.data!.lotteries![0].winners![i].winnerPrice}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.w500)),
                                    SizedBox(height: 4,),
                                    Text("Winner Name : ${getResultDetailsModel!.data!.lotteries![0].winners![i].userName}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.w500),),
                                    SizedBox(height: 4,),
                                  ],
                                ),
                                Container(
                                  width: 100,
                                  height: 50,
                                  child: Card(
                                    elevation: 2,
                                    child: Center(child: Text("${getResultDetailsModel!.data!.lotteries![0].winners![i].lotteryNo}")),),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ),
          )

      ),
    ) ;
  }

  GetResultDetailsModel? getResultDetailsModel;
  // Future<void> getResultDetails() async {
  //   // isLoading.value = true;
  //   var param = {
  //     'game_id': widget.gId
  //   };
  //   print('____param______${param}_________');
  //   apiBaseHelper.postAPICall(getResultAPI, param).then((getData) {
  //     String msg = getData['msg'];
  //     getResultDetailsModel = GetResultDetailsModel.fromJson(getData);
  //     setState(() {
  //
  //     });
  //     Fluttertoast.showToast(msg: msg);
  //     //isLoading.value = false;
  //   });
  // }
  getInvatation() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=cefaa9477065503c4ca2ed67af58f3c87c6bfab4'
    };
    var request = http.Request('POST', Uri.parse('https://punjablottery.online/Apicontroller/getResults'));
    request.body = json.encode({
      'game_id': widget.gId
    });
    print("------Surendra-------${request.body}----------");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetResultDetailsModel.fromJson(json.decode(result));
      setState(() {
        getResultDetailsModel = finalResult;
        print("------Surendra-------${result}----------");
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");

    }
    else {
      print(response.reasonPhrase);
    }

  }


}
