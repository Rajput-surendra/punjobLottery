import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Routes/routes.dart';

class SignupController extends AppBaseController {
  RxBool isLoading = false.obs ;
  Future<void> registerUser(
      {
      required String mobile,
      required String? referral,
      required String? name}) async {
    isLoading.value = true ;

    var param = {
      'userName': name,
      'mobile': mobile,
      'referralCode':referral,

    };
    apiBaseHelper.postAPICall(getUserRegister, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];
       print('____param______${getUserRegister}______${param}___');
      if (status) {
        Get.toNamed(otpScreen, arguments: [mobile, getData['otp']]);
        Fluttertoast.showToast(msg: msg);

      } else {

        Fluttertoast.showToast(msg: msg);

      }
      isLoading.value = false ;
    });
  }
}
