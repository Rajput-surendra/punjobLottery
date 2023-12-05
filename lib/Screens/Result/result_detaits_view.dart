
import 'dart:convert';

import 'package:booknplay/Services/api_services/apiConstants.dart';
import 'package:booknplay/Utils/Colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/HomeModel/get_result_details_model.dart';

import 'package:http/http.dart'as http;
class ResultDetailsScreen extends StatefulWidget {
  ResultDetailsScreen({Key? key, this.isFrom,this.gId}) : super(key: key);
  final bool? isFrom;
  String ? gId;

  @override
  State<ResultDetailsScreen> createState() => _ResultDetailsScreenState();
}

class _ResultDetailsScreenState extends State<ResultDetailsScreen> {
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
            title: const Text("Result Details",style: TextStyle(fontSize: 17),),
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
                                      Text("${getResultDetailsModel!.data!.lotteries![0].winners![i].winningPosition} Winner",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold)),
                                      SizedBox(height: 4,),
                                      Text(" Price : ₹${getResultDetailsModel!.data!.lotteries![0].winners![i].winnerPrice}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.w500)),
                                      SizedBox(height: 4,),
                                      Text(" Name : ${getResultDetailsModel!.data!.lotteries![0].winners![i].userName}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.w500),),
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

  getInvatation() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=cefaa9477065503c4ca2ed67af58f3c87c6bfab4'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/getResults'));
    request.body = json.encode({
      'game_id':widget.gId
    });
    print("------Surendra-------${request.body}----------");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetResultDetailsModel.fromJson(json.decode(result));
      setState(() {
        getResultDetailsModel = finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");

    }
    else {
      print(response.reasonPhrase);
    }

  }


}
