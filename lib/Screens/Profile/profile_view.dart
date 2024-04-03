import 'dart:convert';

import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Profile/profile_controller.dart';
import 'package:booknplay/Screens/Withdrawal/withdrawal_view.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/custom_clip_path.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/get_profile_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../Auth_Views/Login/login_view.dart';
import '../FaQ/faq_view.dart';
import '../My Transaction/transaction_view.dart';
import 'package:http/http.dart'as http;

import 'edit_profile.dart';
class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key, this.isFrom}) : super(key: key);
  final bool? isFrom;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditProfile = false ;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    referCode();
  }
  String? mobile,userId,userName,userBalance;
  referCode() async {
    mobile = await SharedPre.getStringValue('userMobile');
    userName = await SharedPre.getStringValue('userData');
    userId = await SharedPre.getStringValue('userId');
    userBalance = await SharedPre.getStringValue('balanceUser');
    setState(() {
      getProfile();
    });
  }
  GetProfileModel? getProfileModel;

  getProfile() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=68b65db8a6659ad0354398bd4cd6449fc10b9b7f'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiGetProfile'));
    request.body = json.encode({
      "user_id": userId.toString()
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {

      var result =  await response.stream.bytesToString();
      var finalResult = GetProfileModel.fromJson(json.decode(result));
      setState(() {
        getProfileModel= finalResult;
      });
      Fluttertoast.showToast(msg: "${finalResult.msg}");
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.greyColor,
        body: bodyWidget(context,),
    )
    );
  }
  Widget bodyWidget(BuildContext context, ) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 2),(){
         // get();
        });
      },
      child: ListView.builder(
        itemCount: 1,
          itemBuilder: (context,i){
        return  getProfileModel == null || getProfileModel == " " ? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
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
                      child:const Text("My Profile",style: TextStyle(color: AppColors.whit,fontSize: 20,fontWeight: FontWeight.bold),) ),
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
                              image:  DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("${getProfileModel?.profile?.image}")
                              )
                          ),
                        ),

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
              // isEditProfile ? const SizedBox.shrink() :
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("${getProfileModel?.profile?.userName}",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                    Center(child: Text("${getProfileModel?.profile?.mobile}",style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: AppColors.fntClr),)),
                    Center(child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen(getProfileModel: getProfileModel,))).then((value) => getProfile());
                      },
                        child: const Text("Edit Profile",style: TextStyle(color: AppColors.secondary,fontSize: 15,fontWeight: FontWeight.bold),))),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: AppColors.fntClr),
                              color: AppColors.whit
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset("assets/images/Balance.png",height: 20,color: AppColors.profileColor,),
                                  const Text("Balance : ",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                  Text("${getProfileModel?.profile?.walletBalance}",style: const TextStyle(color: AppColors.profileColor),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(referAndEranScreen);

                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(color: AppColors.fntClr),
                                  color: AppColors.whit
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/images/Refer & Earn.png",height: 20,color: AppColors.profileColor,),
                                    const Text("Refer & Earn ",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                    const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10,),
                    // InkWell(
                    //   onTap: (){
                    //     Get.toNamed(homeScreen);
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(7),
                    //         border: Border.all(color: AppColors.fntClr)
                    //     ),
                    //     child:  Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               Image.asset("assets/images/My Lottery.png",height: 20,color: AppColors.profileColor,),
                    //               SizedBox(width: 10,),
                    //               Text("My Lottery",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                    //             ],
                    //           ),
                    //           Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(addMoney);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Add Money.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Add Cash",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WithdrawalScreen()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Withdrawal.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Withdrawal",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(invitation);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/My Invitation.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("My Invitation",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionScreen()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/My Transaction.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("My Transaction",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),

                    InkWell(
                      onTap: (){
                        Get.toNamed(notice);

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/notification.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Notice",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(video);

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/How to Play.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("How to Play",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(contact);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Contact Us.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Contact Us",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(enquiry);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Enquiry.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Enquiry",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        share();
                        // Get.toNamed(inviteFriend);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/rate app.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Rate App",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(privacyScreen);

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Privacy Policy.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Privacy Policy",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(termConditionScreen);

                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/Terms & Conditions.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("Terms and Conditions",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Get.toNamed(faq);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/FAQ.png",height: 20,color: AppColors.profileColor,),
                                  const SizedBox(width: 10,),
                                  const Text("FAQs",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        deleteAccountDailog();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                 Icon(Icons.delete,color: AppColors.profileColor,),
                                  SizedBox(width: 10,),
                                  Text("Delete",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_outlined,color: AppColors.greyColor,size: 17,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) {
                            String contentText = "";
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text("Are you sure you want to Logout"),
                                  content: Text(contentText),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () async{
                                        await SharedPre.clear('userId');
                                        await Future.delayed(const Duration(milliseconds: 500));
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                                        setState(()  {

                                          //Get.toNamed(loginScreen);
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
                            border: Border.all(color: AppColors.fntClr),
                            color: AppColors.whit
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/logout.png",height: 20,color: AppColors.profileColor,),
                              const SizedBox(width: 10,),
                              const Text("Logout",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
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
      }),
    );
  }



  deleteAccountDailog() async {
    await dialogAnimate(context,
        StatefulBuilder(builder: (BuildContext context, StateSetter setStater) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStater) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  content:  const Text(
                      "Are you sure you want to delete account ?",
                      style: TextStyle(color: AppColors.primary)
                  ),
                  actions: <Widget>[
                    TextButton(
                        child: const Text( "NO",style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                    TextButton(
                        child:  const Text( "YES",style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                        //  deleteAccount();
                          Navigator.of(context).pop(false);
                          // SettingProvider settingProvider =
                          // Provider.of<SettingProvider>(context, listen: false);
                          // settingProvider.clearUserSession(context);
                          // //favList.clear();
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     '/home', (Route<dynamic> route) => false);
                        })
                  ],
                );
              });
        }));
  }
  dialogAnimate(BuildContext context, Widget dialge) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: dialge),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // pageBuilder: null
        pageBuilder: (context, animation1, animation2) {
          return Container();
        } //as Widget Function(BuildContext, Animation<double>, Animation<double>)
    );
  }
  deleteAccount() async {

    var headers = {
      'Cookie': 'ci_session=96944ca78b243ab8f0408ccfec94c5f2d8ca05fc'
    };
    var request = http.MultipartRequest('GET', Uri.parse('$baseUrl1/Authentication/delete_account/$userId'));
    // request.fields.addAll({
    //   'user_id': userId.toString()
    // });
    print('____Som______${request}_________');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult =  jsonDecode(result);
      Fluttertoast.showToast(msg: "${finalResult['message']}");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
    else {
      print(response.reasonPhrase);
    }

  }



  Future<void> share() async {
    await FlutterShare.share(
        title: 'Invite Friend',
        text: 'Invite Friend',
        linkUrl: 'https://www.youtube.com/watch?v=jqxz7QvdWk8&list=PLjVLYmrlmjGfGLShoW0vVX_tcyT8u1Y3E',
        chooserTitle: 'Invite Friend'
    );
  }
// Function to execute when the user confirms logout
  Widget logOut(context){
    return AlertDialog(
      title: const Text('Confirm Logout'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Logout'),
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
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Text(data,
                  style: const TextStyle(
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
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
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
