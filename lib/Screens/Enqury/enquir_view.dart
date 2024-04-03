import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:video_player/video_player.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_video_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Utils/Colors.dart';
import '../../Widgets/app_button.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({Key? key}) : super(key: key);

  @override
  State<Enquiry> createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }
  String? userId;
  getUser() async {
    userId = await SharedPre.getStringValue('userId');
    print('______userId____${userId}_________');
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whit,
        appBar: AppBar(
          foregroundColor: AppColors.whit,

          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("Enquiry",style: TextStyle(fontSize: 17),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius:   BorderRadius.only(
                bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10),),
            color: AppColors.secondary
              // gradient: RadialGradient(
              //     center: Alignment.center,
              //     radius: 1.1,
              //     colors: <Color>[AppColors.primary, AppColors.secondary]),
            ),
          ),
        ),
          body:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 3,
                    controller: nameController,
                    decoration: const InputDecoration(
                      // labelText: 'Enquiry',
                      hintText: 'Enter your enquiry',
                      border: OutlineInputBorder(), // Add an outline border
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your enquiry';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50.0),
                  AppButton(
                    title: isLoading  ? 'please wait....':"Enquiry",
                    onTap:(){
                      if (_formKey.currentState!.validate()) {
                        enquiry();
                      }else{
                        Fluttertoast.showToast(msg: "enquiry is required");
                      }
                    } ,
                  )

                ],
              ),
            ),
          )


      ),
    );
  }

  bool isLoading = false;
   // Future<void> enquiry() async {
   //  // isLoading = true;
   //   var param = {
   //     'user_id':userId.toString(),
   //     'enquiry':nameController.text,
   //   };
   //   apiBaseHelper.postAPICall(addEnquiryAPI, param).then((getData){
   //       String msg = getData['msg'];
   //       Fluttertoast.showToast(msg: msg);
   //       Navigator.pop(context);
   //      // isLoading = false;
   //     isLoading = false;
   //   });
   // }
  enquiry() async {
    isLoading = true;
  var headers = {
    'Content-Type': 'application/json',
    'Cookie': 'ci_session=cc2f49dfd8b9108ae58a179239b5497bb9eefd82'
  };
  var request = http.Request('POST', Uri.parse('https://punjablottery.online/Apicontroller/apiSubmitContactUs'));
  request.body = json.encode({
    'user_id':userId.toString(),
    'enquiry':nameController.text,
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    isLoading = false;
    var result = await response.stream.bytesToString();
    var finalResult =  jsonDecode(result);
    Fluttertoast.showToast(msg: "${finalResult['msg']}");
    setState(() {

    });
    Navigator.pop(context);
  }
  else {
    isLoading = false;
  print(response.reasonPhrase);
  }

}

  // Future<void> enquiry() async {
  //   // isLoading.value = true;
  //   var param = {
  //     'user_id': userId.toString(),
  //     'enquiry': _nameController.text,
  //   };
  //   apiBaseHelper.postAPICall(getPrivacyAPI, param).then((getData) {
  //     bool status = getData['status'];
  //     String msg = getData['msg'];
  //
  //     if (status == true) {
  //
  //     } else {
  //       Fluttertoast.showToast(msg: msg);
  //     }
  //     //isLoading.value = false;
  //   });
  // }

}
