import 'package:booknplay/Constants.dart';
import 'package:booknplay/Routes/routes.dart';
import 'package:booknplay/Screens/Dashboard/dashboard_controller.dart';
import 'package:booknplay/Utils/Colors.dart';
import 'package:booknplay/Widgets/commen_widgets.dart';
import 'package:booknplay/Widgets/custom_appbar.dart';
import 'package:booknplay/Widgets/drawer_icon_tab_widget.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Bookings/my_booking_view.dart';
import '../Home/home_view.dart';
import '../Profile/profile_view.dart';
import '../Result/result_view.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  //final GlobalKey<ScaffoldState> _key = GlobalKey();
  int currentIndex = 1 ;
  int bottomIndex = 0;

  List <Widget> pageList  = [
    HomeScreen(),
    ResultScreen(),
    MyBookingsScreen(isFrom: false),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Display a confirmation dialog when the back button is pressed.
        bool exit = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Exit App'),
              content: Text('Are you sure you want to exit the app?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Cancel exit
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Confirm exit
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );

        return exit ?? false; // Exit if the user confirmed (true) or continue if canceled (false).
      },
      child: Scaffold(

                bottomNavigationBar: CurvedNavigationBar(
                  //buttonBackgroundColor: Colors.white,
                  color: AppColors.secondary,
                  backgroundColor: AppColors.greyColor,
                  items: const [
                    CurvedNavigationBarItem(

                        child: ImageIcon(AssetImage(AppConstants.homeIcon),
                            color: AppColors.whit),
                        label: 'Home',
                        labelStyle: TextStyle(color: AppColors.whit)
                    ),
                    CurvedNavigationBarItem(
                        child: ImageIcon(AssetImage(AppConstants.calenderIcon),
                            color: AppColors.whit),
                        label: 'Result',
                        labelStyle: TextStyle(color: AppColors.whit)
                    ),
                    CurvedNavigationBarItem(
                        child: ImageIcon(AssetImage(AppConstants.myLotteryIcon),
                            color: AppColors.whit),
                        label: 'My Contest',
                        labelStyle: TextStyle(color: AppColors.whit)
                    ),
                    CurvedNavigationBarItem(
                        child: ImageIcon(AssetImage(AppConstants.profileIcon),
                            color: AppColors.whit),
                        label: 'My Profile',
                        labelStyle: TextStyle(color: AppColors.whit)
                    ),
                  ],
                  onTap: (index) {
                    setState(() {
                      bottomIndex = index;
                    });

                    //Handle button tap
                  },
                ),
              key: _key,


              backgroundColor: AppColors.greyColor,

              body: pageList[bottomIndex]

            ),
    );
  }
}
