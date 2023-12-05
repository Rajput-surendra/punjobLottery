import 'package:booknplay/Services/api_services/apiStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../Models/HomeModel/get_video_model.dart';
import '../../Services/api_services/apiConstants.dart';
import '../../Utils/Colors.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
   List<VideoPlayerController> _vController = [];
  List<bool> isPlayed = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVideo();
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
          title: const Text("How To Pay",style: TextStyle(fontSize: 17),),
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
          body:videoModel == null || videoModel == "" ? Center(child: CircularProgressIndicator()): videoModel?.content?.length == 0 ? Text("No our activity found!!!"): SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: videoModel?.content?.length ?? 0,
              itemBuilder: (context,i){
                var  showData = videoModel?.content?[i];
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${showData?.howToPlayContent}",style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        // _vController[i] == null ?
                        // Text(""):
                        Container(
                          //  height:MediaQuery.of(context).size.height/3.2,
                          margin: const EdgeInsets.only(bottom: 10),
                          child:
                           Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height:MediaQuery.of(context).size.height/3.5,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: AspectRatio(aspectRatio: _vController[i].value.aspectRatio,child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: VideoPlayer(_vController[i])),)),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                              Positioned(
                                  left: 1,right: 1,
                                  top: -10,
                                  bottom: 1,
                                  child: isPlayed[i] == true ? InkWell(
                                      onTap: (){
                                        setState(() {
                                          isPlayed[i] = false;
                                          _vController[i].pause();
                                        });
                                      },
                                      child: Icon(Icons.pause,color: Colors.white,)) : InkWell(
                                      onTap: (){
                                        setState(() {
                                          isPlayed[i] = true;
                                          _vController[i].play();
                                        });
                                      },
                                      child: Icon(Icons.play_arrow,color: Colors.white,))),
                                ],
                             ),
                        ),

                      ],
                    ),
                  ),
                );
              }),
        ) ,

      ),
    );
  }
  VideoModel?videoModel;
  Future<void> getVideo() async {
    apiBaseHelper.postAPICall2(getVideoAPI).then((getData) {
      setState(() {
        videoModel = VideoModel.fromJson(getData);
      });
      for(var i=0;i<videoModel!.content!.length;i++){
        _vController.add(VideoPlayerController.network(videoModel!.content![i].videoLink.toString())..initialize().then((value){
          setState(() {
          });
        }));
        isPlayed.add(false);
        print("video controller length ${_vController.length}----------${_vController}");
      }
      //isLoading.value = false;
    });
  }

}
