import 'package:flutter/material.dart';
import 'package:media_booster/utills/utills.dart';

class Video_component extends StatefulWidget {
  const Video_component({Key? key}) : super(key: key);

  @override
  State<Video_component> createState() => _Video_componentState();
}

class _Video_componentState extends State<Video_component> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        itemCount: allVideos.length,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.primaries[i].shade300,
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  'Videodetails_page',
                  arguments: allVideos[i],
                );
              },
              title: Text(
                // "${allVideos[i]['Name']}",style: TextStyle(),
                allVideos[i]['Name'],
              ),
            ),
          );
        },
      ),
    );
  }
}
