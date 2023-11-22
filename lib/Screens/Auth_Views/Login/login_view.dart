import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/extentions.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) => Scaffold(
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
            child:  Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  Text("Login",style: TextStyle(color: AppColors.whit,fontWeight: FontWeight.bold,fontSize: 25),),
                     SizedBox(height: 50,),
                   Image.asset("assets/images/login.png",height: 150,width: 200,),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: textField(
                        title: 'Mobile Number',
                        prefixIcon: Icons.phone,
                        inputType: TextInputType.phone,
                        maxLength: 10,
                        controller: _mobile),
                  ),
                  SizedBox(height: 60,),
                  Obx(
                        () =>  Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: controller.isLoading.value == true ? const Center(child: CircularProgressIndicator(),) : AppButton(title:  'Send OTP' ,onTap: (){
                        controller.sendOtp(mobile: _mobile.text);
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whit),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(signupScreen);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: AppColors.whit,
                                fontSize: 15,
                              fontWeight: FontWeight.bold
                             ),
                          ))
                    ],
                  )
                ],
              ),
            ),
             ),
        ),
      ),
    );
  }
}
