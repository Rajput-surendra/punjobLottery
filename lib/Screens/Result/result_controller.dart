import 'dart:io';

import 'package:booknplay/Controllers/app_base_controller/app_base_controller.dart';
import 'package:booknplay/Local_Storage/shared_pre.dart';
import 'package:booknplay/Models/auth_response_model.dart';
import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResultController extends AppBaseController {


RxBool isLoading = false.obs ;

File? _image;
final picker = ImagePicker();

final phoneC = TextEditingController();
final emailC = TextEditingController();
final addressC = TextEditingController();

bool isEditProfile = false ;
User usedata = User();

String name = '' ;
String wallet = '' ;




@override
  void onInit() async{
    // TODO: implement onInit

  var obj = await SharedPre.getObjs(SharedPre.userData);

  usedata = User.fromJson(obj);

  getProfile();
  }

Future getImageFromGallery() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }

}

Future <void> getProfile () async{
  isLoading.value = true;
  var param = {
    'user_id': usedata.id.toString(),
  };
  apiBaseHelper.postAPICall(getProfileApi, param).then((getData) {
    bool error = getData['status'];
    String msg = getData['message'];
    if (error) {
    //  Fluttertoast.showToast(msg: msg);
      name = getData['data']['first_name'];
      phoneC.text = getData['data']['mobile'];
      emailC.text = getData['data']['email'];
      addressC.text = usedata.address ?? '';
      wallet =  getData['data']['wallet'].toString();
      update();

    } else {
      Fluttertoast.showToast(msg: msg);
    }
    isLoading.value = false;
  });
}

Future <void> updateProfile () async{

  isLoading.value = true;

  var param = {
    'user_id': usedata.id.toString(),
    'name':usedata.name ?? '',
      'email': emailC.text,
    'mobile': phoneC.text,
    'address': addressC.text
  };
  apiBaseHelper.postAPICall(updateProfileApi, param).then((getData) {
    bool error = getData['status'];
    String msg = getData['message'];

    if (error) {

      getProfile();
      Fluttertoast.showToast(msg: msg);


    } else {
      Fluttertoast.showToast(msg: msg);
    }
    isLoading.value = false;
  });
}

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }

  }
}