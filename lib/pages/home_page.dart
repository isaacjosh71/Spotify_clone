
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/pages/album_page.dart';
import 'package:page_transition/page_transition.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;
  int activeMenu2 = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Explore',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Icon(Entypo.list),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: List.generate(songType_1.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      activeMenu1 = index;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(songType_1[index],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: activeMenu1 == index ? Colors.teal : Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      activeMenu1 == index
                                          ? Container(
                                        width: 10,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.circular(5),
                                        ),)
                                          : Container()
                                    ],
                                  ),
                                ),
                              )),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: List.generate(songs.length - 5, (index)
                      => Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                PageTransition(
                                    alignment: Alignment.bottomCenter,
                                    child: AlbumPage(
                                      song: songs[index],
                                    ),
                                    type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        songs[index]['img']
                                      )
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.teal
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(songs[index]['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white
                              ),),const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(songs[index]['description'],
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
                  ],
                ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: List.generate(songType_2.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  activeMenu2 = index;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(songType_2[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: activeMenu2 == index ? Colors.teal : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  activeMenu2 == index
                                      ? Container(
                                    width: 10,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(5),
                                    ),)
                                      : Container()
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: List.generate(songs.length -5, (index)
                      => Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            songs[index+5]['img']
                                        )
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.teal
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(songs[index+5]['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white
                                ),),const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(songs[index+5 ]['description'],
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
              ],
            ),
        ),
    );
  }
}

