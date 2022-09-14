
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key,
    required this.title,
    required this.description,
    required this.img,
    required this.color,
    required this.songURL}) : super(key: key);
  final String title;
  final String description;
  final String img;
  final Color color;
  final String songURL;

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double _currentSliderValue = 20;
  late AudioPlayer advancedPlayer;
  late AudioCache audioCache;
  bool isPlaying=true;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer (){
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    playSound(widget.songURL);
  }

  playSound(localPath) async {
    await audioCache.play(localPath);
  }

  stopSound(localPath) async {
    File audioFile = await audioCache.load(localPath) as File;
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.stop();
  }

  seekSound() async {
    File audioFile = await audioCache.load(widget.songURL) as File;
    await advancedPlayer.setUrl(audioFile.path);
    advancedPlayer.seek(const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    super.dispose();
    stopSound(widget.songURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.vertical_split_rounded))
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:
          Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 40, top: 30),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                            color: widget.color,
                            blurRadius: 50,
                            spreadRadius: 5,
                            offset: const Offset(-10, 40)
                          )],
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, right: 40, top: 30),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: SizedBox(
                  height: 70,
                  width: size.width-80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Iconic.folder,
                        color: Colors.white,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(widget.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),),
                          SizedBox(
                            width: 150,
                            child: Text(widget.description,
                              maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.5)
                            ),),
                          ),
                        ],
                      ),
                      const Icon(Iconic.resize_vertical,
                        color: Colors.white,),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Slider(value: _currentSliderValue,
                  activeColor: Colors.teal,
                  min: 0,
                  max: 200,
                  onChanged: (value){
                setState(() {
                  _currentSliderValue = value;
                });
                seekSound();
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1:52',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),),
                    Text('4:30',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),)
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Entypo.shuffle,
                      color: Colors.white.withOpacity(0.8),),
                      onPressed: () {  },),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Entypo.fast_backward,
                      color: Colors.white.withOpacity(0.8),),
                      onPressed: (){},),
                    IconButton(
                      iconSize: 30,
                      icon: Container(
                        child: Center(
                          heightFactor: 50,widthFactor: 50,
                          child: Icon(isPlaying
                              ? Entypo.stop
                              : Entypo.play,
                            color: Colors.white.withOpacity(0.8),),
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.teal,
                        ),
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          stopSound(widget.songURL);
                          setState(() {
                            isPlaying = false;
                          });
                        } else {
                          playSound(widget.songURL);
                          setState(() {
                            isPlaying = true;
                          });
                        }
                      },),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Entypo.fast_forward,
                      color: Colors.white.withOpacity(0.8),),
                      onPressed: () {  },),
                    IconButton(
                      iconSize: 30,
                      icon: Icon(Entypo.retweet,
                      color: Colors.white.withOpacity(0.8),),
                      onPressed: () {},),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.tv_rounded,
                      color: Colors.white.withOpacity(0.8),),
                    onPressed: () {},),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 5),
                    child: Text('Chromecast is ready',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  )
                ],
              ),
            ],
          ),
      );
  }
}
