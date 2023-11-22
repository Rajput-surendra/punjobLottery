import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Home/HomeController.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Models/HomeModel/get_slider_model.dart';
import '../../Models/HomeModel/lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../Winner/winner_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSlider();
    getLottery();
  }
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whit,
        appBar: AppBar(
          automaticallyImplyLeading: false,

          shape: const RoundedRectangleBorder(
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50),
            ),),
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("PUNJAB LOTTERY",style: TextStyle(fontSize: 17),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10),),
              gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.9,
                  colors: <Color>[AppColors.primary, AppColors.secondary]),
            ),
          ),
        ),

        body:getSliderModel == null ?Center(child: CircularProgressIndicator()) :SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Text('Welcome To Punjab Lottery',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
              ),),
               ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                      items: getSliderModel?.sliderdata!
                          .map(
                            (item) => Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                "${item.sliderImage}",
                                              ),
                                              fit: BoxFit.fill)),
                                    )
                                ),
                              ),
                            ]),
                      )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: 150,
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 1.8,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPost = index ;
                            });

                          })),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildDots(),),
                  // sliderPointers (items , currentIndex),

                ],),

              // getCatListView(controller),
              //sliderPointers (controller.catList , controller.catCurrentIndex.value ),
              const SizedBox(height: 5,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     color: AppColors.lotteryColor,
                     height: 160,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           const Text(
                             "Punjab Lottery",
                             style: TextStyle(
                                 color: AppColors.fntClr,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold),
                           ),
                           const SizedBox(
                             height: 10,
                           ),
                           const Text(
                             "Daily lotteries 200Rs.",
                             style: TextStyle(
                                 color: AppColors.fntClr,
                                 fontSize: 12
                             ),
                           ),
                           const SizedBox(height: 5,),
                           InkWell(
                             onTap: (){
                              // Get.toNamed(winnerScreen);
                             },
                             child: Container(
                               height: 90,
                               child: ListView.builder(
                                   scrollDirection: Axis.horizontal,
                                   itemCount: 5,
                                   itemBuilder: (BuildContext context, int index) {
                                     return Container(
                                         height: 90,
                                         width: 150,
                                         child: Padding(
                                           padding: const EdgeInsets.all(1.0),
                                           child: Image.asset("assets/images/slider1.png",fit: BoxFit.fill,),
                                         ));
                                   }
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(0.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          Padding(
                           padding: EdgeInsets.only(left: 8),
                           child: Text(
                             "${lotteryModel?.data?.name.toString()}",
                             style: TextStyle(
                                 color: AppColors.fntClr,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Container(
                             height: MediaQuery.of(context).size.height/1.1,
                             child: ListView.builder(
                               scrollDirection: Axis.vertical,
                                 shrinkWrap: true,
                                 physics: const NeverScrollableScrollPhysics(),
                                itemCount:lotteryModel?.data?.lotteries?.length ,
                                 // itemCount:2,
                                 itemBuilder: (context, index) {
                                   return InkWell(
                                     onTap: (){
                                       if( lotteryModel?.data?.lotteries?[index].active == '0' ){
                                         Fluttertoast.showToast(msg: "Booking not yet to be start");
                                       }else{
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>WinnerScreen(gId:lotteryModel?.data?.lotteries?[index].gameId )));
                                       }

                                       //Get.toNamed(winnerScreen,arguments:lotteryModel?.data?.lotteries?[index].gameId );
                                     },
                                     child: Padding(
                                       padding: const EdgeInsets.all(5.0),
                                       child: Container(
                                         height: 115,
                                         decoration: const BoxDecoration(
                                             image: DecorationImage(
                                                 image: AssetImage("assets/images/lotteryback.png"), fit: BoxFit.fill)),
                                         child:  Column(
                                           children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5,right: 5),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                  children: [

                                                    Text("Price:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                    SizedBox(width: 2,),
                                                    Text("${lotteryModel?.data?.lotteries?[index].ticketPrice}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                  ],
                                                ),

                                                  Row(
                                                    children: [
                                                      SizedBox(height: 25,),
                                                      Text("Open:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                      SizedBox(width: 2,),
                                                      Text("${lotteryModel?.data?.lotteries?[index].openTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(height: 25,),
                                                      Text("Close:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                      SizedBox(width: 2,),
                                                      Text("${lotteryModel?.data?.lotteries?[index].closeTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                           Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Text("${lotteryModel?.data?.lotteries?[index].userCount}",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                 lotteryModel?.data?.lotteries?[index].active == '0' ? SizedBox.shrink():  Text("Betting is Running Now",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                    Container(
                                                      height: 45,width: 50,
                                                      child: ClipRRect(
                                                       borderRadius: BorderRadius.circular(10),
                                                      child: Image.network("${lotteryModel?.data?.lotteries?[index].image}",fit: BoxFit.fill,)),
                                                    ),
                                               ],
                                             ),
                                           ),

                                             Padding(
                                               padding: const EdgeInsets.only(left: 5,right: 5),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Row(
                                                     children: [
                                                       SizedBox(height: 25,),
                                                       Text("Start:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                       SizedBox(width: 2,),
                                                       Text("${lotteryModel?.data?.lotteries?[index].date}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                     ],
                                                   ),
                                                   Row(
                                                     children: [
                                                       SizedBox(height: 25,),
                                                       Text("End:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                       SizedBox(width: 2,),
                                                       Text("${lotteryModel?.data?.lotteries?[index].endDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                     ],
                                                   ),
                                                   Row(
                                                     children: [

                                                       Text("Result:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                       SizedBox(width: 2,),
                                                       Text("${lotteryModel?.data?.lotteries?[index].resultDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                     ],
                                                   ),
                                                 ],
                                               ),
                                             ),
                                              
                                           ],
                                         )
                                       ),
                                     ),
                                   );
                                 }
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                   SizedBox(height: 20,)
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }

  Widget sliderPointers (List doteList , int currentIndex ) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        doteList
            .asMap()
            .entries
            .map((entry) {
          return GestureDetector(
            // onTap:()=> controller.carouselController.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 8 : 8,
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == entry.key
                      ? AppColors.primary
                      : Colors.black
              ),
            ),
          );
        }).toList());
  }
  int _currentPost = 0;
   _buildDots() {
    List<Widget> dots = [];
    if (getSliderModel == null) {
    } else {
      for (int i = 0; i < getSliderModel!.sliderdata!.length; i++) {
        dots.add(
          Container(
            margin: EdgeInsets.all(1.5),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPost == i ?  AppColors.profileColor : AppColors.secondary,
            ),
          ),
        );
      }
    }
    return dots;
  }

  GetSliderModel? getSliderModel;
  Future<void> getSlider() async {
    // isLoading.value = true;
    var param = {
      'app_key':""
    };
    apiBaseHelper.postAPICall(getSliderAPI, param).then((getData) {
      bool status = getData['status'];
      String msg = getData['msg'];
      if (status == true) {
        getSliderModel = GetSliderModel.fromJson(getData);
      } else {
        Fluttertoast.showToast(msg: msg);
      }
      //isLoading.value = false;
    });
  }


  LotteryModel? lotteryModel;
  Future<void> getLottery() async {
    apiBaseHelper.postAPICall2(getLotteryAPI).then((getData) {
      setState(() {
        lotteryModel = LotteryModel.fromJson(getData);
      });

      //isLoading.value = false;
    });
  }
}
