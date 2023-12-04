import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/HomeModel/contact_us_model.dart';
import '../../Models/HomeModel/notice_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Utils/Colors.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key, }) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getNotice();

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
          title: const Text("Notice",style: TextStyle(fontSize: 17),),
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
        body:noticeModel == null ? Center(child: CircularProgressIndicator(color: AppColors.primary,)): SingleChildScrollView(
          child:Container(
            height: MediaQuery.of(context).size.height/1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: noticeModel?.notices?.length ?? 0,
                itemBuilder: (context,i){
              return  Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${noticeModel?.notices?[i].noticeMsg}"),
                          SizedBox(height: 5,),
                          Text("${noticeModel?.notices?[i].noticeDate}"),
                          SizedBox(height: 5,),
                          Text("${noticeModel?.notices?[i].insertDate}"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          )
        ),
      ),
    );
  }

  NoticeModel?noticeModel;
  Future<void> getNotice() async {
    apiBaseHelper.postAPICall2(getNoticeAPI).then((getData) {
      setState(() {
        noticeModel = NoticeModel.fromJson(getData);
      });

      //isLoading.value = false;
    });
  }
}