
import 'package:flutter/material.dart';
import 'package:media_booster/controllers/providers/app_provider.dart';
import 'package:media_booster/models/app_model.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:media_booster/components/audio/audiodetails_page.dart';
import 'package:media_booster/views/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/videos/videodetails_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isdark = preferences.getBool('isdark') ?? false;

  bool sliderside = preferences.getBool('sliderside') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioPlayer_provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => isPlay_Provider(
            audioPlayer_Model: AudioPlayer_Model(isplay: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PopupMenuButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeAccessProvider(
            themeAccessModel: ThemeAccessModel(
              themeaccessmodel: isdark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CarousalSliderAccessProvider(
            carousalSliderAccess_Model: CarousalSliderAccess_Model(
              isvertical: sliderside,
            ),
          ),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          initialRoute: "/",
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
          themeMode: (Provider.of<ThemeAccessProvider>(context)
                  .themeAccessModel
                  .themeaccessmodel)
              ? ThemeMode.light
              : ThemeMode.dark,
          routes: {
            '/': (context) => const Home_page(),
            'Audiodetails_page': (context) => const Audiodetails_page(),
            'Videodetails_page': (context) => const Videodetails_page(),
          },
          debugShowCheckedModeBanner: false,
        );
      }),
      // builder: (context, _) {
      //   return MaterialApp(
      //     initialRoute: "/",
      //     theme: AppTheme.lighttheme,
      //     darkTheme: AppTheme.darktheme,
      //     themeMode: (Provider.of<ThemeAccessProvider>(context)
      //             .themeAccessModel
      //             .themeaccessmodel)
      //         ? ThemeMode.light
      //         : ThemeMode.dark,
      //     routes: {
      //       '/': (context) => const Home_page(),
      //       'Music_page': (context) => const Music_page(),
      //       'Audiodetails_page': (context) => const Audiodetails_page(),
      //       'Videodetails_page': (context) => const Videodetails_page(),
      //     },
      //     debugShowCheckedModeBanner: false,
      //   );
      // },
    ),
  );
}
