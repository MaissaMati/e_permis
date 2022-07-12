import 'package:chewie/chewie.dart';
import 'package:e_permis/back_end/export_all.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/widgets.dart';
import '../../main.dart';
import 'colors.dart';
import '../affichage lecons/lecon_affichage.dart';


Widget video(BuildContext context,String video) {

  

  _chewie(){
  ChewieListItem my_chewie = ChewieListItem(
    videoPlayerController: VideoPlayerController.asset(getTranslated(context,video )),
    looping: true,
  );
  my_chewie.videoPlayerController.setVolume( son? 1:0);
  return my_chewie;
}

  return 
  Card(
    elevation: 0.0,
    color: white_grey,
    child: /*InViewNotifierList(
        isInViewPortCondition:  (double deltaTop, double deltaBottom, double viewPortDimension) {
          return deltaTop < (0.5 * viewPortDimension) &&  deltaBottom > (0.5 * viewPortDimension);
        },
        builder: (BuildContext context, int index) {
        return InViewNotifierWidget(
          id: 'unique-Id',
          builder: (BuildContext context, bool isInView, Widget child) {
            return*/ Container(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(getTranslated(context,"apperçu"),style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox (height: 30,),
          /*ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(getTranslated(context,"video2" )),
            looping: true,
          ),*/
          _chewie()
        ],
      ),
    )
        
     /*     }
    );
        }
    )
    */
    );
}



class ChewieListItem extends StatefulWidget {
  // This will contain the Uh which we want to play
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  void checkVideo(){
    // Implement your calls inside these conditions' bodies : 
    if(widget.videoPlayerController.value.isPlaying) {
      print('\n \n video playing \n \n ');
      if(scrolling){
        print('\n \n video paused \n \n ');
        widget.videoPlayerController.pause();
        scrolling = false;
      }
    }
  }
  @override
  void initState() {
    super.initState();

    widget.videoPlayerController.addListener(checkVideo);

    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: widget.looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }

  

}