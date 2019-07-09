import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
final String EXTRA_DATA = "EXTRA_DATA";

class VideoPlayerPlugin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPlayerPluginState();
  }
}

class VideoPlayerPluginState extends State<VideoPlayerPlugin> {
  VideoPlayerController _videoPlayerController;
  
  @override
  void initState() {
    _videoPlayerController=VideoPlayerController.network("http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4")
    ..initialize()
    .then((_){
      setState(() {
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("视频播放器"),
      ),
      body: Center(
        child: _videoPlayerController.value.initialized?AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,child: VideoPlayer(_videoPlayerController),):Container(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
