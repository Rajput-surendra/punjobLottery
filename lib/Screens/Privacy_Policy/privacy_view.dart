import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Utils/Colors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key, }) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPrivacy();

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
          title: const Text("Privacy Policy",style: TextStyle(fontSize: 17),),
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
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  // privacyPolicy == null ? Center(child: CircularProgressIndicator()) :Html(
                  //     data:"${privacyPolicy}"
                  // )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }

  String? privacyPolicy;
  Future<void> getPrivacy() async {
    // isLoading.value = true;
    var param = {
      'content':'privacy_policy'
    };
    apiBaseHelper.postAPICall(getPrivacyAPI, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];

      if (status == true) {
        privacyPolicy = getData['content']['name'];
        print('privacyPolicy${privacyPolicy}_________');
        // getSliderModel = GetSliderModel.fromJson(getData);
      } else {
        Fluttertoast.showToast(msg: msg);
      }
      //isLoading.value = false;
    });
  }
}