import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Home/HomeController.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Models/HomeModel/get_result_model.dart';
import '../../Models/HomeModel/get_slider_model.dart';
import '../../Models/HomeModel/lottery_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Services/api_services/apiStrings.dart';
import '../Notification/notification_view.dart';
import '../Winner/winner_details_view.dart';
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
    getResult();
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10
              ),
              child: InkWell(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                },
                  child: Image.asset("assets/images/notification.png",height: 15,width:20,color: AppColors.profileColor,)),
            ),
          ],
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
        body:lotteryModel == null ?Center(child: CircularProgressIndicator()) :RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2),(){
              getSlider();
              getLottery();
              getResult();
            });
          },
          child: ListView.builder(
            itemCount: 1,
              itemBuilder: (context,i){
            return  Column(
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
                    getSliderModel == null ? Center(child: CircularProgressIndicator()):   CarouselSlider(
                        items: getSliderModel!.sliderdata!
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
                              "Winner Lottery",
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
                              child: getResultModel?.data?.lotteries?.length == 0 ? Center(child: Text("No winner list!!")): Container(
                                height: 80,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                      itemCount:getResultModel?.data?.lotteries?.length ?? 0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return  InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WinnerDetailsScreen(gId: getResultModel!.data!.lotteries![index].gameId,)));
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 170,
                                          decoration:  const BoxDecoration(
                                            image:  DecorationImage(
                                              image:  AssetImage("assets/images/homewinnerback.png"),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child:  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          width: 90,
                                                            child: Text("${getResultModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.whit,fontSize: 14),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                                        SizedBox(height: 3,),
                                                         Text("₹${getResultModel!.data!.lotteries![index].winners![0].winnerPrice}",style: TextStyle(color: AppColors.whit),),
                                                        SizedBox(height: 3,),
                                                         Container(
                                                           width: 90,
                                                             child: Text(getResultModel!.data!.lotteries![index].winners![0].userName??"",style: TextStyle(color: AppColors.whit),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                                                      ],
                                                    ),
                                                    ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          child: Image.network("${getResultModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
                                                    ),
                                                  ],
                                                ),

                                              ],
                                            ),
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
                    ),
                    lotteryModel!.data!.lotteries!.length ==  0 ? Center(child: Text("No Lotteries Found!!")):  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "${lotteryModel!.data!.name.toString()}",
                              style: const TextStyle(
                                  color: AppColors.fntClr,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                             // height: MediaQuery.of(context).size.height/1.1,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:lotteryModel!.data!.lotteries!.length ,
                                  // itemCount:2,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        if(lotteryModel!.data!.lotteries![index].active == '0' ){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WinnerScreen(gId:lotteryModel?.data?.lotteries?[index].gameId )));

                                        }else{
                                          Fluttertoast.showToast(msg: "Booking not yet to be start");
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
                                                          Text("${lotteryModel!.data!.lotteries![index].ticketPrice}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),

                                                      Row(
                                                        children: [
                                                          SizedBox(height: 25,),
                                                          Text("Open:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          Text("${lotteryModel!.data!.lotteries![index].openTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(height: 25,),
                                                          Text("Close:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          Text("${lotteryModel!.data!.lotteries![index].closeTime}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
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
                                                      Text("${lotteryModel!.data!.lotteries![index].gameName}",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                      lotteryModel!.data!.lotteries![index].active == '0' ?  Text("Betting is Running Now",style: TextStyle(color: AppColors.whit,fontSize: 12),):SizedBox.shrink(),
                                                      Container(
                                                        height: 45,width: 50,
                                                        child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(10),
                                                            child: Image.network("${lotteryModel!.data!.lotteries![index].image}",fit: BoxFit.fill,)),
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
                                                          Text("${lotteryModel!.data!.lotteries![index].date}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(height: 25,),
                                                          Text("End:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          Text("${lotteryModel!.data!.lotteries![index].endDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [

                                                          Text("Result:",style: TextStyle(color: AppColors.whit,fontSize: 12),),
                                                          SizedBox(width: 2,),
                                                          Text("${lotteryModel!.data!.lotteries![index].resultDate}",style: TextStyle(color: AppColors.whit,fontSize: 12),)
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
            );
          }),
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
        setState(() {
        });
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

  GetResultModel? getResultModel;
  Future<void> getResult() async {
    apiBaseHelper.postAPICall2(getResultAPI).then((getData) {
      setState(() {
        getResultModel = GetResultModel.fromJson(getData);
      });

      //isLoading.value = false;
    });
  }


}
