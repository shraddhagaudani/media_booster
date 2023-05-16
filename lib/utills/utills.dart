import 'dart:core';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

late TabController tabController;

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.deepPurple,
    ),
  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.deepPurple,
    ),
  );
}
String Photo = "assets/images/malang-sajna.jpg";
String Name = "Malang Sajna";
String Artist = "Sachet-Parampara";
String Path = "assets/audio/Malang-Sajna(PagalWorld).mp3";

int index = 0;
List<Map<String, dynamic>> allSongs = [
  {
    'Name': "Malang Sajna",
    'Song': "Malang-Sajna(PagalWorld).mp3",
    'Path': "assets/audio/Malang-Sajna(PagalWorld).mp3",
    'Photo' : "assets/images/malang-sajna.jpg",
    'Artist' : "Sachet-Parampara",
  },
  {
    'Name': "Brown Munde",
    'Song': "Brown-Munde.mp3",
    'Path': "assets/audio/Brown-Munde.mp3",
    'Photo' :"assets/images/bm.jpeg",
  'Artist' : "AP Dhilion",
  },
  {
    "Name": "Daru Badnam",
    'Song': "Daru-Badnam.mp3",
    'Path': "assets/audio/Daru-Badnam.mp3",
  'Photo' :"assets/images/daru badnam.jpeg",
  'Artist' : "Kamal-Param Singh",
  },
  {
    'Name': "Excuse",
    'Song': "Excuse.mp3",
    'Path': "assets/audio/Excuse.mp3",
    'Photo' :"assets/images/excuse1.jpeg",
  'Artist' : "AP Dhillon",
  },
  {
    'Name': "Kesariya",
    'Song': "Kesariya.mp3",
    'Path': "assets/audio/Kesariya.mp3",
    'Photo' :"assets/images/kesariya1.jpeg", 'Artist' : "Arjit Singh,Pritam",
  },
  {
    'Name': "Maan Meri jaan",
    'Song': "Maanmeri-Jaan.mp3,",
    'Path': "assets/audio/Maanmeri-Jaan.mp3",
    'Photo' :"assets/images/maan meri jaan.jpeg",
  'Artist' : "King",
  },
  {
    'Name': "Rattan Lambiyan",
    'Song': "Rattan-Lambiya.mp3",
    'Path': "assets/audio/Rattan-Lambiya.mp3",
    'Photo' :"assets/images/rattan lambiyan.jpeg",
  'Artist' : "Jubin Nautiyal",
  },
  {
    'Name': "Tere Pyaar Mein",
    'Song': "Tere-Pyaar-Mein.mp3",
    'Path': "assets/audio/Tere-Pyaar-Mein.mp3",
  'Photo' :"assets/images/tere pyar.jpeg",
  'Artist' : "Pritam",
  },
  {
    'Name': "Thumka",
    'Song': "Show-Me-A-Thumka.mp3",
    'Path': "assets/audio/Show-Me-A-Thumka.mp3",
    'Photo' :"assets/images/show me.jpeg",
  'Artist' : "Sunidhi Chauhan",
  },
  {
    'Name': "Manike",
    'Song': "Manike.mp3",
    'Path': "assets/audio/Manike.mp3",
  'Photo' :"assets/images/manike.jpeg",
  'Artist' : "Junin Nautiyal",
  },
  // {"Name": "Jaadui", "Song": "Jaadui.mp3"},
  // {"Name": "Jaadui", "Song": "Jaadui.mp3"},
  // {"Name": "Jaadui", "Song": "Jaadui.mp3"},
  // {"Name": "Jaadui", "Song": "Jaadui.mp3"},
];

CarouselController carouselController = CarouselController();
List<String> Carouselimages = [
  "assets/images/1.jpeg",
  "assets/images/2.png",
  "assets/images/3.jpg",
  "assets/images/4.jpg",
  "assets/images/5.jpg",
];

List<Map<String,dynamic>> allVideos = [
  {
    'Path' :  "assets/videos/1.mp4",
    'Name' : "Papa Video",
  },
  {
    'Path':"assets/videos/2.mp4",
    'Name' : "Birthday Video",
  },
  {
    'Path' : "assets/videos/3.mp4",
    'Name' : "Kaanha Video",
  },
  {
    'Path': "assets/videos/4.mp4",
    'Name': " Bollywood Video",
  } ,
  {
    'Path': "assets/videos/yaari.mp4",
    'Name': " Dosti Video",
  }
];