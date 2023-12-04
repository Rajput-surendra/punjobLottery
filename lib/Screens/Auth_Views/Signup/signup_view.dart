import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Auth_Views/Login/login_view.dart';
import 'package:booknplay/Screens/Auth_Views/Signup/signup_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Utils/extentions.dart';
import 'package:booknplay/Widgets/app_button.dart';
import 'package:booknplay/Widgets/auth_custom_design.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final referralController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SignupController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child:  Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/punbabComman.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 80,),
                        const Text("Sign Up",style: TextStyle(color: AppColors.whit,fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 40,),
                        Image.asset("assets/images/sign up.png",height: 150,width: 200,),
                        const SizedBox(height: 30,),
                        textField(
                            title: 'User Name',
                            prefixIcon: Icons.person,
                            controller: nameController),
                        const SizedBox(
                          height: 15,
                        ),
                        textField(
                            title: 'Mobile Number',
                            prefixIcon: Icons.phone,
                            inputType: TextInputType.phone,
                            maxLength: 10,
                            controller: mobileController),
                        const SizedBox(
                          height: 15,
                        ),
                        textField1(
                            title: 'Referral Code (Optional)',
                            prefixIcon: Icons.person,
                            controller: referralController),
                        const SizedBox(
                          height: 40,
                        ),
                        Obx(
                              () => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25),
                              child: controller.isLoading.value
                                  ? const Center(
                                child:
                                CircularProgressIndicator(),
                              ): AppButton(
                                title: 'Sign Up',
                                onTap: () {
                                  if(mobileController.text.isEmpty && nameController.text.isEmpty) {
                                    Fluttertoast.showToast(msg: "All Fields Required");
                                  } else if(mobileController.text.isEmpty || mobileController.text.length <10 ){
                                    Fluttertoast.showToast(msg: "Please Enter 10 digit number ");
                                  }

                                  else {
                                    controller.registerUser(
                                        mobile: mobileController.text,
                                        name: nameController.text,
                                        referral: referralController.text);

                                  }
                                },
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(loginScreen);
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: AppColors.whit,
                                      fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),


            ),
          );
        });
  }
}
