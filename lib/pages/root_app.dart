
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:spotify_clone/pages/home_page.dart';



class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: downBar(),
      body: getBody(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePage(),
        Center(
          child:
          Text('Home',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child:
          Text('Library',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child:
          Text('Search',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Center(
          child:
          Text('Settings',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }

  Widget downBar(){
    List items= [
      Iconic.home,
      Iconic.book,
      Iconic.search,
      Iconic.wrench,
    ];
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index)
          {
            return IconButton(icon: Icon(items[index],
              color: activeTab == index ? Colors.teal : Colors.white,),
              onPressed: () {
                setState(() {
                  activeTab = index;
                });
              },
            );
          })
          ),),
    );
  }
}
