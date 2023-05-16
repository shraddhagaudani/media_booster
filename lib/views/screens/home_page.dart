import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/components/audio/audio_components.dart';
import 'package:media_booster/components/videos/video_components.dart';
import 'package:media_booster/controllers/providers/app_provider.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:provider/provider.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: allTabs.length,
      vsync: this,
    );
  }

  List<Map<String, dynamic>> allTabs = [
    {
      'icon': Icons.audiotrack_sharp,
      'title': "Audio Player",
    },
    {
      'icon': Icons.video_collection,
      'title': "Video Player",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Multimedia App",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<CarousalSliderAccessProvider>(context, listen: false)
                  .SliderSide();
            },
            icon: const Icon(Icons.grid_on_outlined),
          ),
          PopupMenuButton(
            initialValue: Provider.of<PopupMenuButtonProvider>(context)
                .popupMenuButton_Model
                .initialpopupmenuval,
            onSelected: (val) {
              Provider.of<PopupMenuButtonProvider>(context)
                  .popupMenuButton_Model
                  .initialpopupmenuval = val;
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<ThemeAccessProvider>(context,
                                  listen: false)
                              .ChangeTheme();
                          Navigator.of(context).pop();
                        },
                        icon: (Provider.of<ThemeAccessProvider>(context,
                                    listen: false)
                                .themeAccessModel
                                .themeaccessmodel)
                            ? const Icon(CupertinoIcons.moon)
                            : const Icon(
                                CupertinoIcons.brightness,
                              ),
                      ),
                      const Text("Theme Mode")
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: allTabs
              .map<Widget>(
                (e) => Tab(
                  text: e['title'],
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Audio_component(),
          Video_component(),
        ],
      ),
    );
  }
}
