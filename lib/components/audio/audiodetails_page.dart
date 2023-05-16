import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controllers/providers/app_provider.dart';
import 'package:media_booster/models/app_model.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:provider/provider.dart';

class Audiodetails_page extends StatefulWidget {
  const Audiodetails_page({Key? key}) : super(key: key);

  @override
  State<Audiodetails_page> createState() => _Audiodetails_pageState();
}

class _Audiodetails_pageState extends State<Audiodetails_page> {
  @override
  void initState() {
    super.initState();

    // assetsAudioPlayer.open(
    //   Audio(
    //     "assets/audio/Tere-Pyaar-Mein.mp3",
    //   ),
    //   autoStart: false,
    // );
    // Provider.of<AudioPlayer_Provider>(context).open();

    // Provider.of<AudioPlayer_provider>(context, listen: false).open();
  }


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Navigator.pop(context);
            Provider.of<AudioPlayer_provider>(context, listen: false)
                .assetsAudioPlayer
                .dispose();
          },
        ),
        // actions: [
        //   PopupMenuButton(
        //     itemBuilder: (context) {
        //       return [
        //         PopupMenuItem(
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   Provider.of<AudioPlayer_Provider>(context).assetsAudioPlayer.
        //                 },
        //                 icon: const Icon(
        //                   CupertinoIcons.volume_mute,
        //                 ),
        //               ),
        //               const Text(
        //                 "Mute",
        //               ),
        //             ],
        //           ),
        //         ),
        //       ];
        //     },
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
            16,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   child: CircleAvatar(
              //     radius: 80,
              //     foregroundImage:
              //         AssetImage("${allSongs.map((e) => ['Photo'])}"),
              //   ),
              // ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      data['Photo'],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${data['Name']}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${data['Artist']}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: Provider.of<AudioPlayer_provider>(context)
                    .assetsAudioPlayer
                    .currentPosition,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  Duration data = snapshot.data ?? Duration(seconds: 0);
                  // Duration data = snapshot.data;
                  try {
                    Provider.of<AudioPlayer_provider>(context)
                        .audioPlayer1_Model
                        .duration = Provider.of<AudioPlayer_provider>(
                      context,
                    ).assetsAudioPlayer.current.value!.audio.duration;
                  } catch (e) {
                    Provider.of<AudioPlayer_provider>(context)
                        .audioPlayer1_Model
                        .duration = const Duration(
                      seconds: 0,
                    );
                  }
                  return Column(
                    children: [
                      Slider(
                        min: 0,
                        max: Provider.of<AudioPlayer_provider>(context)
                            .audioPlayer1_Model
                            .duration!
                            .inSeconds
                            .toDouble(),
                        value: data.inSeconds.toDouble(),
                        onChanged: (val) {
                          Provider.of<AudioPlayer_provider>(context,
                                  listen: false)
                              .assetsAudioPlayer
                              .seek(
                                Duration(
                                  seconds: val.toInt(),
                                ),
                              );
                        },
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${data.toString().split(".")[0]}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 185,
                          ),
                          Text(
                            "${Provider.of<AudioPlayer_provider>(context).audioPlayer1_Model.duration.toString().split(".")[0]}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Provider.of<AudioPlayer_provider>(context, listen: false)
                          .Previous10();
                    },
                    icon: const Icon(
                      Icons.skip_previous_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<AudioPlayer_provider>(context, listen: false)
                          .assetsAudioPlayer
                          .previous();
                    },
                    icon: const Icon(
                      Icons.skip_previous_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<isPlay_Provider>(context, listen: false)
                          .Playsong();
                      if (Provider.of<isPlay_Provider>(context,
                                  listen: false)
                              .audioPlayer_Model
                              .isplay ==
                          false) {
                        Provider.of<AudioPlayer_provider>(context,
                                listen: false)
                            .assetsAudioPlayer
                            .pause();
                      } else {
                        Provider.of<AudioPlayer_provider>(context,
                                listen: false)
                            .assetsAudioPlayer
                            .play();
                      }
                    },
                    icon: Provider.of<isPlay_Provider>(context)
                                .audioPlayer_Model
                                .isplay ==
                            false
                        ? const Icon(
                            Icons.play_arrow,
                          )
                        : const Icon(
                            CupertinoIcons.pause,
                          ),
                  ),

                  // IconButton(
                  //   onPressed: () async {
                  //     await Provider.of<AudioPlayer_Provider>(context,
                  //             listen: false)
                  //         .assetsAudioPlayer
                  //         .play();
                  //   },
                  //   icon: const Icon(
                  //     CupertinoIcons.play,
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () async {
                  //     await Provider.of<AudioPlayer_Provider>(context,
                  //             listen: false)
                  //         .assetsAudioPlayer
                  //         .pause();
                  //   },
                  //   icon: const Icon(
                  //     CupertinoIcons.pause,
                  //   ),
                  // ),

                  IconButton(
                    onPressed: () {
                      Photo;
                      Name;
                      Artist;
                      Path;
                      Provider.of<AudioPlayer_provider>(context, listen: false)
                          .assetsAudioPlayer
                          .next();
                    },
                    icon: const Icon(
                      Icons.skip_next_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<AudioPlayer_provider>(context, listen: false)
                          .Next10();
                    },
                    icon: const Icon(
                      Icons.skip_next_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    Provider.of<AudioPlayer_provider>(context, listen: false)
        .assetsAudioPlayer
        .dispose();
  }
  @override
  void deactivate() {
    super.deactivate();
    Provider.of<AudioPlayer_provider>(context).assetsAudioPlayer.stop();
  }
}
