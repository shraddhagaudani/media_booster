import 'dart:core';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controllers/providers/app_provider.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Videodetails_page extends StatefulWidget {
  const Videodetails_page({Key? key}) : super(key: key);

  @override
  State<Videodetails_page> createState() => _Videodetails_pageState();
}

class _Videodetails_pageState extends State<Videodetails_page> {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController;

  loadVideo() async {
    videoPlayerController =
        // VideoPlayerController.asset("${allVideos.map((e) => ['Path'])}")
        VideoPlayerController.asset(allVideos[index++]['Path'])
          ..initialize().then(
            (value) => setState(() {}),
          );

    // await videoPlayerController.initialize();

    setState(() {});
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      allowFullScreen: true,
    );
  }

  @override
  void initState() {
    super.initState();
    loadVideo();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(),
      key: scaffoldkey,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data['Name'],
            ),
            Expanded(
              flex: 16,
              child: Center(
                child: AspectRatio(
                  aspectRatio: videoPlayerController.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              await videoPlayerController.play();
            },
            child: const Icon(
              Icons.play_arrow,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              await videoPlayerController.pause();
            },
            child: const Icon(
              Icons.pause,
            ),
          ),
        ],
      ),
    );
  }
}
