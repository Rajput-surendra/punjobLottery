import 'dart:io';


import 'package:booknplay/Utils/Colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


import 'dart:ui' as ui;


import '../../Widgets/button.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({Key? key, }) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  // @override
  // void initState() {
  //   super.initState();
  //   _razorpay = Razorpay();
  //   _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  // }
  // Razorpay? _razorpay;
  // int? priceRazorpay;
  // String id = '';
  // void openCheckout(amount) async {
  //   double res = double.parse(amount.toString());
  //   priceRazorpay= int.parse(res.toStringAsFixed(0)) * 100;
  //   print("checking razorpay price ${priceRazorpay.toString()}");
  //   // Navigator.of(context).pop();
  //   var options = {
  //     'key': 'rzp_test_1DP5mmOlF5G5ag',
  //     'amount': "${priceRazorpay}",
  //     'name': 'Dr.Apps',
  //     'image':'assets/splash/splashimages.png',
  //     'description': 'PunjabLottery',
  //   };
  //   try {
  //     _razorpay?.open(options);
  //   } catch (e) {
  //     debugPrint('Error: e');
  //   }
  // }
  // Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
  //   Fluttertoast.showToast(msg: "Subscription added successfully");
  //   // getplanPurchaseSuccessApi();
  //
  // }
  // void _handlePaymentError(PaymentFailureResponse response) {
  //   Fluttertoast.showToast(msg: "Payment cancelled by user");
  //   // setSnackbar("ERROR", context);
  //   // setSnackbar("Payment cancelled by user", context);
  // }
  // void _handleExternalWallet(ExternalWalletResponse response) {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whit,
        appBar: AppBar(
          foregroundColor: AppColors.whit,
          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("Add Cash",style: TextStyle(fontSize: 17,color: AppColors.whit),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius:   BorderRadius.only(
                bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10),),
             color: AppColors.secondary,

              // gradient: RadialGradient(
              //     center: Alignment.center,
              //     radius: 1.1,
              //     colors: <Color>[AppColors.primary, AppColors.secondary]),
            ),
          ),
        ),
        body: Column(
           children: [
             showContent()
           ],
        )
    );
  }
  StateSetter? dialogState;
  final _formKey = GlobalKey<FormState>();
  TextEditingController  amtC = TextEditingController();
  TextEditingController  msgC = TextEditingController();
  ScrollController controller = new ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  showContent() {
    return SingleChildScrollView(
      controller: controller,
      child:  Column(
          mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: AppColors.primary,
                      ),
                      Text(
                        " " + 'Current Balance',
                        style: TextStyle(color: AppColors.fntClr,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text("₹150" ),
                  SizedBox(height: 10,),
                  AppButton1(
                    onTap: (){
                      _showDialog();
                    },
                    title: "Add Cash",
                  )
                ],
              ),
            ),
          ),
        ),

      ]),
    );
  }
  _showDialog() async {
    bool payWarn = false;
    await dialogAnimate(context,
        StatefulBuilder(builder: (BuildContext context, StateSetter setStater) {
          dialogState = setStater;
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 2.0),
                    child: Text( "Add Money",
                      style: TextStyle(color: AppColors.fntClr),
                    ),
                  ),
                  // Divider(color: Theme.of(context).colorScheme.lightBlack),
                  Form(
                    key: _formKey,
                    child: Flexible(
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: AppColors.fntClr,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Amount',
                                        hintStyle: TextStyle(color: AppColors.primary,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: amtC,
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: AppColors.activeBorder,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: "Message",
                                        hintStyle: TextStyle(color: AppColors.primary,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: msgC,
                                    )),
                                //Divider(),
                                // Padding(
                                //   padding: EdgeInsets.fromLTRB(20.0, 10, 20.0, 5),
                                //   child: Text(
                                //     "Select Payment Method",
                                //     style: Theme.of(context).textTheme.subtitle2,
                                //   ),
                                // ),
                                Divider(),

                              ])),
                    ),
                  )
                ]),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    'Cancel',
                    style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                        color: AppColors.fntClr,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              TextButton(
                  child: Text(
                    'Send',
                    style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                        color: AppColors.fntClr,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                   //openCheckout(amtC.text);
                   })
               ],
            );
        }));
  }
  dialogAnimate(BuildContext context, Widget dialge) {
    return showGeneralDialog(
        barrierColor: AppColors.fntClr,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(opacity: a1.value, child: dialge),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // pageBuilder: null
        pageBuilder: (context, animation1, animation2) {
          return Container();
        } //as Widget Function(BuildContext, Animation<double>, Animation<double>)
    );
  }
}
