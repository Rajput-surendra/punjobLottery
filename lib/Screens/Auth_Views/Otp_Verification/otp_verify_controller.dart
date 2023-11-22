import 'dart:convert';

import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Local_Storage/shared_pre.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Routes/routes.dart';

class OTPVerifyController extends AppBaseController{




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      data = Get.arguments ;
  }

RxBool isLoading = false.obs ;
  List data = [] ;
  String otp = '' ;


  Future<void> verifyOTP() async {
    isLoading.value = true ;

    var param = {
      'mobile': data[0].toString(),
      'otp': otp,
    };
    apiBaseHelper.postAPICall(verifyOTPAPI, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];

      if (status) {

        SharedPre.setValue('userData', getData['user_name']);
        SharedPre.setValue('userMobile', getData['mobile']);
        SharedPre.setValue('userReferCode', getData['referral_code']);
        SharedPre.setValue('userId', getData['user_id'].toString());

        Fluttertoast.showToast(msg: msg);
        Get.toNamed(bottomBar);

      } else {

        Fluttertoast.showToast(msg: msg);

      }
      isLoading.value = false ;
    });
  }
}