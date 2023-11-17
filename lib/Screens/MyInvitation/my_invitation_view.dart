import 'dart:io';


import 'package:booknplay/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:uuid/uuid.dart';


import 'dart:ui' as ui;


import '../../Widgets/button.dart';

class MyInvitation extends StatefulWidget {
  const MyInvitation({Key? key, }) : super(key: key);

  @override
  State<MyInvitation> createState() => _MyInvitationState();
}

class _MyInvitationState extends State<MyInvitation> {


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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/splash_logo.png",height: 150,),
              ),
              Text(
                'Your Invitation Code:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "invitationCode",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: AppButton1(
                  onTap: (){
                    share();
                  },
                  title: "Invitation Code",
                ),
              ),

            ],
          ),
        ),
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

}
class InvitationCodeGenerator {
  static String generateInvitationCode() {
    // Using the uuid package to generate a unique identifier
    final uuid = Uuid();
    return uuid.v4().substring(0, 8); // You can adjust the length as needed
  }
}
