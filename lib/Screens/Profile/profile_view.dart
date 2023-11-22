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
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Local_Storage/shared_pre.dart';
import '../FaQ/faq_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, this.isFrom}) : super(key: key);
  final bool? isFrom;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        builder: (controller) => SafeArea(
              child: Scaffold(
                body: bodyWidget(context, controller),
              ),
            ));
  }

  Widget bodyWidget(BuildContext context, ProfileController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: DiagonalPathClipperOne(),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  color: AppColors.primary,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.secondary,
                       ),
                ),
              ),
              ClipPath(
                clipper: DiagonalPathClipperOne(),
                child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: RadialGradient(
                            radius: 1.5,
                              // begin: Alignment.centerLeft,
                              // end: Alignment.centerRight,
                              colors: [
                            AppColors.secondary,
                            AppColors.fntClr.withOpacity(0.5),
                            AppColors.secondary1.withOpacity(0.5)
                          ])),
                    )),
              ),
              Positioned(
                  top: MediaQuery.sizeOf(context).height / 25,
                  right: MediaQuery.sizeOf(context).width / 4,
                  left: MediaQuery.sizeOf(context).width / 2.9,
                  child:Text("My Account",style: TextStyle(color: AppColors.whit,fontSize: 20,fontWeight: FontWeight.bold),) ),
              Positioned(
                top: MediaQuery.sizeOf(context).height / 11,
                right: MediaQuery.sizeOf(context).width / 3,
                left: MediaQuery.sizeOf(context).width / 3,
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                          border: Border.all(width: 5, color: AppColors.whit),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppConstants.splashLogo))),

                      /*backgroundImage: _image != null
                                      ? FileImage(_image!)
                                  as ImageProvider<Object>
                                      : AssetImage(
                                      'assets/images/Profile.png')
                                  as ImageProvider<
                                      Object>,*/ // Explicit casting
                    ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: InkWell(
                    //       onTap: () {
                    //         showOptions(context, controller);
                    //       },
                    //       child: const CircleAvatar(
                    //         backgroundColor: Colors.white,
                    //         radius: 20,
                    //         child: Icon(
                    //           Icons.camera_alt_outlined,
                    //           color: AppColors.secondary,
                    //         ),
                    //       ),
                    //     )),
                  ],
                ),
              ),
            ],
          ),
            //  Center(
            //     child: Text(
            //   controller.name,
            //   style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            // )),
          controller.isEditProfile ? const SizedBox.shrink() : 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Surendra Singh",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                      Center(child: Text("9686457824",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                     SizedBox(height: 15,),
                       Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                           child: Container(
                             height: 60,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(7),
                                 border: Border.all(color: AppColors.fntClr)
                             ),
                             child:  Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Image.asset("assets/images/Balance.png",height: 20,color: AppColors.profileColor,),
                                   Text("Balance : ",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                   Text("00rs.",style: TextStyle(color: AppColors.profileColor),),
                                 ],
                               ),
                             ),
                           ),
                         ),
                         SizedBox(width: 5,),
                         Expanded(
                           child: InkWell(
                             onTap: (){
                               Get.toNamed(referAndEranScreen);

                             },
                             child: Container(
                               height: 60,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   border: Border.all(color: AppColors.fntClr)
                               ),
                               child:  Padding(
                                 padding: EdgeInsets.all(8.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Image.asset("assets/images/Refer & Earn.png",height: 20,color: AppColors.profileColor,),
                                     Text("Refer & Earn ",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                     Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr)
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/My Lottery.png",height: 20,color: AppColors.profileColor,),
                                  SizedBox(width: 10,),
                                  Text("My Lottery",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(addMoney);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Add Money.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Add Money",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr)
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Withdrawal.png",height: 20,color: AppColors.profileColor,),
                                  SizedBox(width: 10,),
                                  Text("Withdrawal",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(invitation);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/My Invitation.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("My Invitation",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr)
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/My Transaction.png",height: 20,color: AppColors.profileColor,),
                                  SizedBox(width: 10,),
                                  Text("My Transaction",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      InkWell(
                        onTap: (){
                          Get.toNamed(notice);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/notification.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Notices",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(video);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/How to Play.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("How to Play",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(contact);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Contact Us.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Contact Us",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(enquiry);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Enquiry.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Enquiry",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(inviteFriend);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/rate app.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Rate App",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(privacyScreen);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Privacy Policy.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Privacy Policy",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(termConditionScreen);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/Terms & Conditions.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Terms and Conditions",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(faq);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/FAQ.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("FAQs",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          Get.toNamed(termConditionScreen);

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/notification.png",height: 20,color: AppColors.profileColor,),
                                    SizedBox(width: 10,),
                                    Text("Notifications",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (context) {
                              String contentText = "LogOut";
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: const Text("Are you sure you want  to ? LogOut"),
                                    content: Text(contentText),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() async {
                                            SharedPre setValue = await SharedPre();
                                            await SharedPre.clear('userId');
                                            await Future.delayed(const Duration(seconds: 2));
                                            Get.toNamed(loginScreen);
                                          });
                                        },
                                        child: const Text("Logout"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(color: AppColors.fntClr)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset("assets/images/logout.png",height: 20,color: AppColors.profileColor,),
                                SizedBox(width: 10,),
                                Text("Logout",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
             ),
          ),
        ],
      ),
    );
  }
// Function to execute when the user confirms logout
  Widget logOut(context){
    return AlertDialog(
      title: Text('Confirm Logout'),
      content: Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Logout'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  Widget textContainer(IconData icon, String title, String data) {
    return Container(
      height: 90,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColors.whit,
          border: Border.all(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 0), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            )
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.secondary,
            size: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(data,
                  style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget textFieldContainer(
      IconData icon, String title, ProfileController controller, TextEditingController textEditingController) {
    return Column(
      children: [
        textviewRow(title, icon),
        otherTextField(controller: textEditingController),
      ],
    );
  }

  Widget textviewRow(String title, IconData icon) {
    return Row(children: [
      Icon(icon, color: AppColors.secondary,),
      const SizedBox(
        width: 5,
      ),
      Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
    ]);
  }

  Future showOptions(BuildContext context, ProfileController controller) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              controller.getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              controller.getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
