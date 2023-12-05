import 'dart:convert';

import 'package:booknplay/Services/api_services/apiConstants.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Local_Storage/shared_pre.dart';
import '../../Models/HomeModel/Get_transaction_model.dart';
import '../../Models/HomeModel/lottery_list_model.dart';
import '../../Widgets/button.dart';
import 'package:http/http.dart'as http;

import '../Dashboard/dashboard_view.dart';

class WithdrawalScreen extends StatefulWidget {
  WithdrawalScreen({Key? key, this.isFrom,this.gId}) : super(key: key);
  final bool? isFrom;
  String? gId;

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {

  @override
  void initState() {
    super.initState();
    balanceUser();
  }
  String? userBalance,userId;
  balanceUser() async {
    userBalance = await SharedPre.getStringValue('balanceUser');
    userId = await SharedPre.getStringValue('userId');
    setState(() {
    //  getTransactionApi();
    });
  }
  String selectedOption = "UPI";
  String selected = "Withdrawal";
  TextEditingController upiController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whit,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
              ),),
            toolbarHeight: 60,
            centerTitle: true,
            title: const Text("Withdrawal",style: TextStyle(fontSize: 17),),
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
            child:Column(
              children: [
                tabTop(),
                _currentIndex == 1 ? withdrawal():withdrawalRequest()

              ],
            ),

          )

      ),
    ) ;
  }
  int _currentIndex = 1 ;
  tabTop(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 1;
                  // getNewListApi(1);


                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 1 ?
                    AppColors.secondary
                        : AppColors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 45,
                child: Center(
                  child: Text("Withdrawal",style: TextStyle(color: _currentIndex == 1 ?AppColors.whit:AppColors.fntClr,fontSize: 18)),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: InkWell(
              onTap: (){
                setState(() {
                  _currentIndex = 2;
                  getTransactionApi();
                  // getNewListApi(3);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: _currentIndex == 2 ?
                    AppColors.secondary
                        : AppColors.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                // width: 120,
                height: 45,
                child: Center(
                  child: Text("Withdrawal List",style: TextStyle(color: _currentIndex == 2 ?AppColors.whit:AppColors.fntClr,fontSize: 18),),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


  withdrawal(){
    return  Form(
      key: _formKey,
      child: Column(
        children: [
          showContent(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Payment Method:',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.fntClr),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          value: 'UPI',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value.toString();
                            });
                          },
                        ),
                        const Text('UPI'),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        Radio(
                          value: 'Bank Details',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value.toString();
                            });
                          },
                        ),
                        const Text('Bank Details'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (selectedOption == 'UPI')
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Amount'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: upiController,
                        decoration: const InputDecoration(hintText: 'Enter UPI ID', border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter UPI ID';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            hintText: 'Enter Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number';
                          }
                          return null;
                        },
                      ),

                    ],
                  ),
                if (selectedOption == 'Bank Details')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Amount'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Account Holder Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter account holder name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                            hintText: 'Enter Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter  number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: accountNumberController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Account Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter account number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: bankNameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Bank Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter bank name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: branchAddressController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Branch Address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter branch address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: ifscController,
                        decoration: const InputDecoration(hintText: 'Enter IFSC Code',
                          border: OutlineInputBorder(),),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter IFSC Code';
                          }
                          return null;
                        },
                      ),


                      // Add more TextFormField widgets for other bank details here
                    ],
                  ),
                const SizedBox(height: 20.0),
                AppButton1(
                  title: 'Withdrawal',
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      if (selectedOption == 'UPI') {
                        getWithdrawApi();
                      } else if (selectedOption == 'Bank Details') {

                        getWithdrawApi();
                      }
                    }else{
                      Fluttertoast.showToast(msg: "All field are required");
                    }

                  },
                )
              ],
            ),
          ),

        ],
      ),
    );
  }


  withdrawalRequest(){
   return  getTransactionModel == null? Center(child: CircularProgressIndicator()) : getTransactionModel!.withdrawdata!.isEmpty?  Center(child: Text("No Withdrawal List Found!!")):Container(
     height:  MediaQuery.of(context).size.height/1.2,
     child: ListView.builder(
         itemCount: getTransactionModel?.withdrawdata?.length,
         itemBuilder: (context,i){
           return Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     getTransactionModel?.withdrawdata?[i].acHolderName == "" ? Text(" No acHolderName"): Text("${getTransactionModel?.withdrawdata?[i].acHolderName}"),
                    SizedBox(height: 3,),
                    Text("${getTransactionModel?.withdrawdata?[i].requestNumber}"),
                     SizedBox(height: 3,),
                    Text("₹ ${getTransactionModel?.withdrawdata?[i].requestAmount}"),
                   ],
                 ),
               ),
             ),
           );
         }),
   );
  }

  getWithdrawApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=0c843f87edbac1212c2ea7bef4659a143e3ccbd2'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiUserWithdrawFundRequest'));
    request.body = json.encode({
      "user_id":userId,
      "request_amount":amountController.text,
      "request_number": numberController.text,
      "payment_method": selectedOption == 'UPI' ? 2 : 1,
      "upi_id": selectedOption == 'UPI' ? upiController.text  :"",
      "bank_name":selectedOption == 'Bank Details' ? bankNameController.text : "",
      "branch_address":selectedOption == 'Bank Details' ? branchAddressController.text  : "",
      "ac_holder_name":selectedOption == 'Bank Details' ? nameController.text  : "",
      "ac_number":selectedOption == 'Bank Details' ? accountNumberController.text  : "",
      "ifsc_code":selectedOption == 'Bank Details' ? ifscController.text  : "",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result =  await response.stream.bytesToString();
      var finalResult =  jsonDecode(result);
      Fluttertoast.showToast(msg: "${finalResult['msg']}");
      if(finalResult['status'] == true){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
      }


    }
    else {
    print(response.reasonPhrase);
    }

  }

  LotteryListModel? lotteryDetailsModel;

  StateSetter? dialogState;
  TextEditingController  amtC = TextEditingController();
  TextEditingController  msgC = TextEditingController();
  ScrollController controller = new ScrollController();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  showContent() {
    return SingleChildScrollView(
      controller: controller,
      child:   Column(
          mainAxisSize: MainAxisSize.min, children: [
           Padding(
          padding: EdgeInsets.only(top: 5.0,left:5 ,right: 5),
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
                            fontWeight: FontWeight.bold,fontSize: 18),
                      ),
                    ],
                  ),
                  userBalance == null ? Text("No Balance") :Text("₹${userBalance}" ,style: TextStyle(color: AppColors.fntClr,fontSize: 15),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),

      ]),
    );
  }
  GetTransactionModel? getTransactionModel;
  // getTransactionApi() async {
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Cookie': 'ci_session=18afbdd33b04ace40a80944d83e9e23e3ab91c3e'
  //   };
  //   var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiUserWithdrawTransactionHistory'));
  //   request.body = json.encode({
  //     "user_id":userId
  //   });
  //   print('_____request.body_____${request.body}_________');
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var result = await response.stream.bytesToString();
  //     var finalResult  = GetTransactionModel.fromJson(json.decode(result));
  //     Fluttertoast.showToast(msg: "${finalResult.msg}");
  //     setState(() {
  //       getTransactionModel = finalResult;
  //     });
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  // }


  getTransactionApi() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=329e84d8baf5bbe6fc18f412bda3e26574156d56'
    };
    var request = http.Request('POST', Uri.parse('$baseUrl1/Apicontroller/apiUserWithdrawTransactionHistory'));
    request.body = json.encode({
      "user_id":userId
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result  = await response.stream.bytesToString();
      var finalResult = GetTransactionModel.fromJson(json.decode(result));
      Fluttertoast.showToast(msg: "${finalResult.msg}");
      setState(() {
        getTransactionModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

}
