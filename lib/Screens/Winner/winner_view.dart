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

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({Key? key, this.isFrom}) : super(key: key);
  final bool? isFrom;

  @override
  State<WinnerScreen> createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 82,
        color: AppColors.whit,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Divider(color: AppColors.fntClr,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Balance:",style: TextStyle(color: AppColors.fntClr)),
                      SizedBox(width: 10,),
                      Text("00rs.",style: TextStyle(color: AppColors.profileColor),)
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(10)),
                          gradient:
                          RadialGradient(radius: 1.2,
                              colors: [AppColors.primary, AppColors.secondary]),
                        ),child: Center(child: Text("Buy 1000Rs.",style: TextStyle(color: AppColors.whit),)),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ),
      ),
        backgroundColor: AppColors.whit,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("Winner",style: TextStyle(fontSize: 17),),
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
        body:    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

                SizedBox(height: 20,),
                Container(
               height: 230,
               color: AppColors.lotteryColor,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(

                   children: [
                     const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Winner",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Text("(1000Rs.)",style: TextStyle(color: AppColors.fntClr,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Open 10:00AM"),
                            SizedBox(width: 5,),
                            Text("Close 12:00AM"),
                          ],
                        ),
                      ],
                    ),
                     SizedBox(height: 10,),
                     Card(
                       child: Container(
                         height:170,
                         child: GridView.builder(
                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3, // Number of columns in the grid
                               childAspectRatio: 8/4
                           ),
                           itemCount:cardData.length,
                           itemBuilder: (context, index) {
                             return GestureDetector(
                               onTap: () {
                                 setState(() {
                                   if (selectedCardIndexes.contains(index)) {
                                     selectedCardIndexes.remove(index);
                                   } else {
                                     selectedCardIndexes.add(index);
                                   }
                                 });
                               },
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(

                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(5)),
                                     border: Border.all(color: AppColors.fntClr),
                                     color: selectedCardIndexes.contains(index) ? AppColors.secondary : null,
                                   ),

                                   child: Center(
                                     child: Text(
                                       cardData[index],
                                       style: TextStyle(fontSize: 15.0,color: selectedCardIndexes.contains(index) ? AppColors.whit : null,),
                                     ),
                                   ),
                                 ),
                               ),
                             );
                           },
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
                 SizedBox(height: 300,),
                const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("PH459856",style: TextStyle(color: AppColors.fntClr),),
                Text("1000Rs.",style: TextStyle(color: AppColors.fntClr),)
              ],)

            ],
          ),
        )

    ) ;
  }
  List<int> selectedCardIndexes = [];
  List<String> cardData = ["PH459856", "DF687898", "GD68454W", "PH459856", "DF687898","GD68454W","PH459856","PH459856","PH459856"];

}
