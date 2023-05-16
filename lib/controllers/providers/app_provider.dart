import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/models/app_model.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AudioPlayer_provider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();


  AudioPlayer1_Model audioPlayer1_Model = AudioPlayer1_Model(
    duration: Duration(seconds: 0),
    index: 0,
  );



  // open() {
  //   assetsAudioPlayer.open(
  //     Audio(allSongs.map((e) => ['Path']) as String),
  //     autoStart: false,
  //   );
  //   notifyListeners();
  // }
  open() {

    assetsAudioPlayer.open(
      loopMode: LoopMode.playlist,
      respectSilentMode: true,
      headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
      autoStart: false,
      showNotification: true,
      Playlist(
        audios: allSongs
            .map(
              (e) => Audio(e['Path'],
                  metas: Metas(
                    image: MetasImage(path: e['Photo'], type: ImageType.asset),
                    title: e['Name'],
                    artist: e['Artist'],
                  )),
            )
            .toList(),
        startIndex: audioPlayer1_Model.index,
      ),
    );
    try {
      audioPlayer1_Model.duration =
          assetsAudioPlayer.current.value!.audio.duration;
    } catch (e) {
      audioPlayer1_Model.duration = const Duration(
        seconds: 0,
      );
    }
    // next() {
    //   assetsAudioPlayer.next();
    //   notifyListeners();
    // }
    notifyListeners();
  }

  Previous10() async {
    await assetsAudioPlayer.seekBy(
      const Duration(
        seconds: -10,
      ),
    );
    notifyListeners();
  }

  Next10() async {
    await assetsAudioPlayer.seekBy(
      const Duration(
        seconds: 10,
      ),
    );
    notifyListeners();
  }
}

class isPlay_Provider extends ChangeNotifier {
  AudioPlayer_Model audioPlayer_Model;

  isPlay_Provider({
    required this.audioPlayer_Model,
  });

  Playsong() {
    audioPlayer_Model.isplay = !audioPlayer_Model.isplay;
    notifyListeners();
  }

}


class PopupMenuButtonProvider extends ChangeNotifier {
  PopupMenuButton_Model popupMenuButton_Model =
      PopupMenuButton_Model(initialpopupmenuval: null);

}

class ThemeAccessProvider extends ChangeNotifier {
  ThemeAccessModel themeAccessModel;

  ThemeAccessProvider({required this.themeAccessModel});

  ChangeTheme() async {
    themeAccessModel.themeaccessmodel = !themeAccessModel.themeaccessmodel;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(
      'isdark',
      themeAccessModel.themeaccessmodel,
    );
    notifyListeners();
  }
}

class CarousalSliderAccessProvider extends ChangeNotifier {
  CarousalSliderAccess_Model carousalSliderAccess_Model;

  CarousalSliderAccessProvider({required this.carousalSliderAccess_Model});

  SliderSide() async {
    carousalSliderAccess_Model.isvertical =
        !carousalSliderAccess_Model.isvertical;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(
      'sliderside',
      carousalSliderAccess_Model.isvertical,
    );
    notifyListeners();
  }
}

// class VideoPlayer_Provider extends ChangeNotifier{
//
//   late VideoPlayerController videoPlayerController;
//
//   // loadVideos() async {
//   //   videoPlayerController = VideoPlayerController.network(
//   //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
//   //
//   //   await
//   //
//   // }
//
//   // loadVideos() async {
//   //   notifyListeners();
//   //   videoPlayerController = VideoPlayerController.network(
//   //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
//   //   await videoPlayerController.initialize();
//   //
//   //
//   //
//   // }
//
// loadVideos()async{
//     notifyListeners();
//     videoPlayerController = VideoPlayerController.asset(allVideos[index]['Path']);
//
//     await videoPlayerController.initialize();
// }
// }
