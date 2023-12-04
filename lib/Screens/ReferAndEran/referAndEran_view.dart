import 'dart:io';

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
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

import '../../Local_Storage/shared_pre.dart';
import '../../Services/api_services/apiConstants.dart';

class ReferAndEran extends StatefulWidget {
  const ReferAndEran({Key? key, }) : super(key: key);

  @override
  State<ReferAndEran> createState() => _ReferAndEranState();
}

class _ReferAndEranState extends State<ReferAndEran> {
  @override
   initState() {
    // TODO: implement initState
    super.initState();
    getMobile();
  }
  String? mobile,userReferCode;
  getMobile() async {
     mobile =  await SharedPre.getStringValue('userMobile');
     userReferCode = await SharedPre.getStringValue('userReferCode');
     setState(() {

     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whit,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("Refer & Earn",style: TextStyle(fontSize: 17),),
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
        body:Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Image.asset("assets/images/refer.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      "Refer And Earn",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: AppColors.fntClr),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Invite your friends to join and get the reward as soon as your friend first order placed",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Text(
                     "Your Referral Code",
                      style: TextStyle(color: AppColors.fntClr),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:  BoxDecoration(
                        border: Border.all(
                          width: 1,
                          style: BorderStyle.solid,
                          color: AppColors.secondary,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "${userReferCode}",
                          style: TextStyle(color: AppColors.fntClr),
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColors.activeBorder,
                          borderRadius:
                          new BorderRadius.all(const Radius.circular(4.0))),
                      child: Text("Tap to copy",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.whit),
                        ),),
                    onPressed: () {
                      Clipboard.setData(new ClipboardData(text: "$userReferCode"));
                      // setSnackbar('Refercode Copied to clipboard');
                      Fluttertoast.showToast(msg: 'Refercode Copied to clipboard',
                          backgroundColor: AppColors.primary
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  AppButton(
                    onTap: () {
                      // var str =
                      //     "$appName\nRefer Code:$""\n${getTranslated(context, 'APPFIND')}$androidLink$packageName\n\n${getTranslated(context, 'IOSLBL')}\n$iosLink$iosPackage";
                      // Share.share(mobile ?? "");
                      share(referCode: userReferCode);

                    },
                    title: "Share",
                  )
                  // SimBtn(
                  //   size: 0.8,
                  //   title: "Share",
                  //   onBtnSelected: () {
                  //     var str =
                  //         "$appName\nRefer Code:$"REFER_CODE"\n${getTranslated(context, 'APPFIND')}$androidLink$packageName\n\n${getTranslated(context, 'IOSLBL')}\n$iosLink$iosPackage";
                  //     Share.share(str);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  GlobalKey keyList = GlobalKey() ;
  bool iconVisible = true;
  Future<void> share({String? referCode}) async {

    await FlutterShare.share(
        title: 'Refer and Eran',
        text: '$referCode',
        linkUrl: 'Refer and Eran',
        chooserTitle: 'Example Chooser Title'
    );
  }

}
