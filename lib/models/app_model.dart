import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioPlayer_Model {
  bool isplay;

  AudioPlayer_Model( {required this.isplay});

// AudioPlayer_Model({
//  required this.isplay,this.inde
// });
}

class AudioPlayer1_Model {
  Duration duration;
  int index;
  AudioPlayer1_Model({required this.duration, required this.index});
}

class PopupMenuButton_Model {
  String? initialpopupmenuval;

  PopupMenuButton_Model({
    required this.initialpopupmenuval,
  });
}

class ThemeAccessModel {
  bool themeaccessmodel;

  ThemeAccessModel({required this.themeaccessmodel});
}

class CarousalSliderAccess_Model {
  bool isvertical = false;

  CarousalSliderAccess_Model({
    required this.isvertical,
  });
}
