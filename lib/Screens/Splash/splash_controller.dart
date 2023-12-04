import 'dart:async';
import 'dart:io';
import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Local_Storage/shared_pre.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class SplashController extends AppBaseController {



  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // checkLogin();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]);
    checkLogin();
  }

  checkInternet() async {

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        checkLogin();
      }
    } on SocketException catch (_) {


      print('not connected');
      // Get.offAllNamed(noInterNetScreen);

    }
  }




  checkLogin() async{

    Timer(const Duration(seconds: 3),() async{
      final isLogin = await SharedPre.getBoolValue(SharedPre.isLogin);

      if(isLogin){

        Get.offAllNamed(bottomBar);

      }else {

        Get.offAllNamed(loginScreen);

      }
    });




  }





}