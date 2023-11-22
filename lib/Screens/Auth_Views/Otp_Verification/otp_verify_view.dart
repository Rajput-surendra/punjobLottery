import 'package:booknplay/Constants.dart';
import 'package:booknplay/Screens/Auth_Views/Otp_Verification/otp_verify_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Routes/routes.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _Otp();
}

class _Otp extends State<OTPVerificationScreen> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: OTPVerifyController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/punbabComman.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right:20,left: 20,top: 90),
                child: Column(
                  children: [
                    Text("Verification",style: TextStyle(color: AppColors.whit,fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 50,),
                    Image.asset("assets/images/verification.png",height: 150,width: 200,),
                    const SizedBox(height: 30,),
                    Text('Code has been sent to',style: TextStyle(color: AppColors.whit),),
                    Text(controller.data[0].toString(),style: const TextStyle(fontSize: 20,color: AppColors.whit),),
                    Text('OTP: ${controller.data[1]}',style: const TextStyle(fontSize: 20,color: AppColors.whit),),

                    const SizedBox(height: 30,),
                    PinCodeTextField(

                      //errorBorderColor:Color(0xFF5ACBEF),
                      //defaultBorderColor: Color(0xFF5ACBEF),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        controller.otp = value.toString() ;
                      },
                      textStyle: TextStyle(color: AppColors.whit),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                         activeColor: AppColors.whit,
                         inactiveColor: AppColors.whit,
                         fieldHeight: 60,
                         fieldWidth: 60,
                         inactiveFillColor: AppColors.whit,
                         activeFillColor: Colors.white,
                      ),
                      //pinBoxRadius:20,
                      appContext: context, length: 4 ,
                    ),
                    // OtpTextField(
                    //   numberOfFields: 4,
                    //      borderRadius:  BorderRadius.all(Radius.circular(10)),
                    //   //set to true to show as box or false to show as dash
                    //   showFieldAsBox: true,
                    //   fillColor: Colors.white,
                    //   filled: ,
                    //   onCodeChanged: (String code) {
                    //
                    //   },
                    //   //runs when every textfield is filled
                    //   onSubmit: (String verificationCode){
                    //     showDialog(
                    //         context: context,
                    //         builder: (context){
                    //           return AlertDialog(
                    //             title: Text("Verification Code"),
                    //             content: Text('Code entered is $verificationCode'),
                    //           );
                    //         }
                    //     );
                    //   }, // end onSubmit
                    // ),
                    const SizedBox(height: 30,),
                    Text("Haven't received the verification code?",style: TextStyle(color: AppColors.whit,fontSize: 16),),
                    InkWell(onTap: (){
                     // controller.sendOtp();
                    },
                        child: const Text('Resend',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: AppColors.whit),)),
                    const SizedBox(height: 70,),
                    Obx(() => Padding(padding: const EdgeInsets.only(left: 25, right: 25), child: controller.isLoading.value ? const Center(child: CircularProgressIndicator(),) : AppButton(onTap: (){
                      controller.verifyOTP() ;

                    },title: 'Verify OTP'))

                    ),
                  ],
                ),
              ),
            ),
          ),


        );
      }
    );
  }



}