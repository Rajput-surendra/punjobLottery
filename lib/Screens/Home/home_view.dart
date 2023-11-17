import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Home/HomeController.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  List<Widget> items = [
    Image.asset('assets/images/slider1.png'),
    Image.asset('assets/images/slider2.png'),
    Image.asset('assets/images/slider1.png'),
    Image.asset('assets/images/slider4.png'),
    Image.asset('assets/images/slider1.png'),
  ];
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

        body: SingleChildScrollView(
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
                      items: items
                          .map(
                            (item) => Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage('assets/images/slider2.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  )),
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
                            _currentPost = index ;
                            setState(() {

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
                               Get.toNamed(winnerScreen);
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
                         const Padding(
                           padding: EdgeInsets.only(left: 8),
                           child: Text(
                             "Matka Lotteries",
                             style: TextStyle(
                                 color: AppColors.fntClr,
                                 fontSize: 18,
                                 fontWeight: FontWeight.bold),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Container(
                             height: MediaQuery.of(context).size.height/2.4,
                             child: ListView.builder(
                                 shrinkWrap: true,
                                 physics: const NeverScrollableScrollPhysics(),
                                 itemCount: 3,
                                 itemBuilder: (BuildContext context, int index) {
                                   return InkWell(
                                     onTap: (){

                                     },
                                     child: Container(
                                         height: 105,
                                         width: 150,
                                         child: Padding(
                                           padding: const EdgeInsets.all(5.0),
                                           child: Image.asset("assets/images/slider4.png",fit: BoxFit.fill,),
                                         )),
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
    if (items == null) {
    } else {
      for (int i = 0; i < items.length; i++) {
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
}
