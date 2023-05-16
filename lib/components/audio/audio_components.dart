import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controllers/providers/app_provider.dart';
import 'package:media_booster/models/app_model.dart';
import 'package:media_booster/utills/utills.dart';
import 'package:provider/provider.dart';

class Audio_component extends StatefulWidget {
  const Audio_component({Key? key}) : super(key: key);

  @override
  State<Audio_component> createState() => _Audio_componentState();
}

class _Audio_componentState extends State<Audio_component> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              scrollDirection:
                  (Provider.of<CarousalSliderAccessProvider>(context)
                              .carousalSliderAccess_Model
                              .isvertical ==
                          false)
                      ? Axis.vertical
                      : Axis.horizontal,
              autoPlay: true,
              height: 280,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              onPageChanged: (val, _) {
                setState(() {
                  i = val;
                });
              }),
          items: Carouselimages.map(
            (e) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(24,),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.black,
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width * 0.4,
          height: height * 0.014,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              borderRadius: BorderRadius.circular(24),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Carouselimages.map(
              (e) => GestureDetector(
                onTap: () {
                  Photo;
                  Name ;
                  Artist ;
                  Path;
                  print("==================");
                  print(Photo);
                  print(Name);
                  print(Artist);
                  print("===================");
                  i = Carouselimages.indexOf(e);
                  carouselController.animateToPage(i);
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: (Carouselimages.indexOf(e) == i)
                      ? Colors.black45
                      : Colors.white70,
                ),
              ),
            ).toList(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 17,
          child: ListView.builder(
            itemCount: allSongs.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(6),
                child: Card(
                  color: Colors.primaries[i % 18].shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        // Provider.of<AudioPlayer1_Model>(context,listen: false).index = i;

                        Provider.of<AudioPlayer_provider>(context,listen: false).audioPlayer1_Model.index = i ;

                        Provider.of<AudioPlayer_provider>(context,listen: false).open();
                        Navigator.of(context).pushNamed(
                          'Audiodetails_page',
                          arguments: allSongs[i],

                        );
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        foregroundImage: AssetImage(
                          "${allSongs[i]['Photo']}",
                        ),
                      ),
                      title: Text(
                        "${allSongs[i]['Name']}",
                      ),
                      subtitle: Text(
                        "${allSongs[i]['Artist']}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Audiodetails_page');
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: Container(
    //     child: ListView.builder(
    //       itemCount: allSongs.length,
    //       itemBuilder: (context, i) {
    //         return Padding(
    //           padding: const EdgeInsets.all(8.0,),
    //           child: GestureDetector(
    //             onTap: () {
    //               index = i;
    //               Navigator.of(context)
    //                   .pushNamed('Details_page', arguments: allSongs[i]);
    //             },
    //             child: Container(
    //               padding: const EdgeInsets.all(8),
    //               height: 130,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(
    //                     20,
    //                   ),
    //                   color: Colors.primaries[i].shade300),
    //               child: Row(
    //                 children: [
    //                   CircleAvatar(
    //                     radius: 30,
    //                     backgroundImage: AssetImage(
    //                       allSongs[i]['Photo'],
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     width: 20,
    //                   ),
    //                   Text(
    //                     "${allSongs[i]['Name']}",
    //                     style: const TextStyle(
    //                         fontWeight: FontWeight.bold, fontSize: 18),
    //                   ),
    //                   const SizedBox(
    //                     width: 50,
    //                   ),
    //                   IconButton(onPressed: (
    //
    //                       ){Navigator.of(context).pushNamed('Details_page');}, icon: Icon(Icons.play_arrow_outlined))
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    //     // child: GridView.builder(
    //     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     //       crossAxisCount: 2,
    //     //       mainAxisSpacing: 5,
    //     //       crossAxisSpacing: 5,
    //     //     ),
    //     //     itemCount: allSongs.length,
    //     //     itemBuilder: (context, i) {
    //     //       return Container(
    //     //         height: 100,
    //     //         alignment: Alignment.center,
    //     //         decoration: BoxDecoration(
    //     //           borderRadius: BorderRadius.circular(20),
    //     //           color: Colors.primaries[i%18].shade300,
    //     //         ),
    //     //       );
    //     //     }),
    //   ),
    // );
    // return  ListView.builder(itemCount: allSongs.length,itemBuilder: (context,i){
    //   return Container(
    //     padding: EdgeInsets.all(16),
    //     height: 100,
    //     color: Colors.blue,
    //     child: ListTile(
    //       leading:CircleAvatar(
    //         radius: 50,
    //       ) ,
    //       title: Text("${allSongs[i]['Name']}"),
    //     ),
    //   );
    // }
    // );
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<AudioPlayer_provider>(context, listen: false)
        .assetsAudioPlayer
        .dispose();
  }
}
