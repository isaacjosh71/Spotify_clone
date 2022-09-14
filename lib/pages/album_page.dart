
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotify_clone/json/songs_json.dart';
import 'package:spotify_clone/pages/music_screen.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, this.song}) : super(key: key);
  final dynamic song;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody(){
    var size= MediaQuery.of(context).size;
    List songsAlbums= widget.song['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.song['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 12),
                        child: Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: List.generate(songs.length, (index)
                    => Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: MusicScreen(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    songURL: songs[index]['song_url'],
                                    color: songs[index]['color'],
                                    img: songs[index]['img']
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
                              height: 15,
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
                              width: size.width-200,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(songs[index]['song_count'],
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),),
                                    Text(songs[index]['date'],
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(songsAlbums.length, (index) =>
               Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: MusicScreen(
                                title: widget.song['title'],
                                description: widget.song['description'],
                                songURL: widget.song['song_url'],
                                color: widget.song['color'],
                                img: widget.song['img']
                            ),
                            type: PageTransitionType.scale));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: (size.width-60)*0.77,
                        child: Text("${index+1}  "+ songsAlbums[index]['title'],
                        style: const TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(
                        width: (size.width-60)*0.23,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Text(songsAlbums[index]['duration'],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        ),),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.8)
                        ),
                        child: const Icon(Icons.play_arrow_rounded,
                        color: Colors.white,),

                       ),
                        ],
                      ),
                      )
                    ],
                  ),
                ),
              ),),
              )
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: const Icon(Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,)),
                IconButton(onPressed: (){
                },
                    icon: const Icon( Iconic.comment,
                    size: 20,
                    color: Colors.white,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
