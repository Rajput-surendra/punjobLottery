import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Utils/Colors.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key, }) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  initState() {
    // TODO: implement initState
    super.initState();

  }

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
          title: const Text("Faq",style: TextStyle(fontSize: 17),),
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
        body:ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primary)
                    ),
                    child: ExpansionTile(
                      title: SizedBox(),
                      subtitle: Text("This is a Surendra Singh"),
                      children: <Widget>[
                        ListTile(title: Text("asdsdadasdsdsdsfs",
                          style: TextStyle(
                              fontSize: 12, color: Colors.pink),),)
                      ],
                    ),
                  ),

                  // index != 2
                  //     ? Divider(thickness: 1)
                  //     : SizedBox.shrink(),
                ],
              );
            }),
      ),
    );
  }

}