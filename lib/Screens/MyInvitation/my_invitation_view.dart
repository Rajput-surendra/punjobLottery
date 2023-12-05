import 'dart:convert';
import 'dart:io';
import 'package:booknplay/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart'as http;
import 'dart:ui' as ui;
import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_invaite_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../../Widgets/button.dart';

class MyInvitation extends StatefulWidget {
  const MyInvitation({Key? key, }) : super(key: key);

  @override
  State<MyInvitation> createState() => _MyInvitationState();
}

class _MyInvitationState extends State<MyInvitation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    referCode();
    //getInvatation();
  }
  String? userReferCode;
  referCode() async {
    userReferCode = await SharedPre.getStringValue('userReferCode');
    setState(() {
      getInvatation();
    });
  }
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
          title: const Text("My Invitation",style: TextStyle(fontSize: 17),),
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
        body: SingleChildScrollView(

          child:myInvationModel == null ?Center(child: CircularProgressIndicator()):myInvationModel!.invitees!.length == 0 ?Center(child: Text("No Invation List!! ")) :Container(
            height: MediaQuery.of(context).size.height/1.1,
            child: ListView.builder(
              itemCount: myInvationModel?.invitees?.length ?? 0,
                itemBuilder: (context,i){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Card(
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Name: "),
                                SizedBox(height: 3,),
                                Text("${myInvationModel?.invitees?[i].userName}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),)
                              ],
                            ),
                               SizedBox(height: 3,),

                               Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Mobile No: "),
                                SizedBox(height: 3,),
                                Text("${myInvationModel?.invitees?[i].mobile}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(height: 3,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Referred By: "),
                                SizedBox(height: 3,),
                                Text("${myInvationModel?.invitees?[i].referredBy}",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold))
                              ],
                            ),
                             ],
                           ),
                         ),
                       ),
                     );
               }),
          ),
        )
    );

  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Invite Friend',
        text: 'Invite Friend',
        linkUrl: 'https://www.youtube.com/watch?v=jqxz7QvdWk8&list=PLjVLYmrlmjGfGLShoW0vVX_tcyT8u1Y3E',
        chooserTitle: 'Invite Friend'
    );
  }
  GetInvaiteModel? myInvationModel;
  getInvatation() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=cefaa9477065503c4ca2ed67af58f3c87c6bfab4'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiGetInvitees'));
    request.body = json.encode({
      // "referred_by":userReferCode
      "referred_by":'2675db01c965'
    });
    print('___request.body_______${request.body}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetInvaiteModel.fromJson(json.decode(result));
      setState(() {
        myInvationModel = finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");

    }
    else {
      print(response.reasonPhrase);
    }

  }

}
class InvitationCodeGenerator {
  static String generateInvitationCode() {
    // Using the uuid package to generate a unique identifier
    final uuid = Uuid();
    return uuid.v4().substring(0, 8); // You can adjust the length as needed
  }



}
