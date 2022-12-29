import 'package:beat_box/const/const.dart';
import 'package:beat_box/screens/home/home.dart';
import 'package:beat_box/screens/library/library.dart';
import 'package:beat_box/screens/navigationpage/bottomcontroller.dart';
import 'package:beat_box/screens/scarchscreen/scarch_screen.dart';
import 'package:beat_box/screens/settingsdrawer/settings_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

//   @override
//   State<NavigationPage> createState() => _NavigationPageState();
// }

// class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MyHome(),
//Nowplaying(audioPlayer: ),
    Library(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<BottomCom>(
        init: BottomCom(),
        builder: (c) {
          return Scaffold(
            drawer: SettingsDrawer(),
            appBar: AppBar(
              backgroundColor: kblack,
              shape: kappbarshape,
              title: Text('BEAT BOX', style: kmaintextstyle),
              centerTitle: true,
              toolbarHeight: 60,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(Searchbar());
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
            body: Center(
              child: _widgetOptions.elementAt(c.selectedindex.value),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30)),
                color: kblack,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GNav(
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      c.BottomChange(index);
                    },
                    backgroundColor: kblack,
                    color: knavbar,
                    activeColor: knavbar,
                    tabBackgroundColor: klightblue,
                    padding: const EdgeInsets.all(10),

                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      const GButton(
                        icon: Icons.home,
                        text: 'Home',
                        textStyle: TextStyle(fontSize: 20, color: kwhite),
                      ),
                      // const GButton(
                      //   icon: Icons.play_arrow,
                      //   text: 'Now Playing',
                      //   textStyle: TextStyle(fontSize: 10, color: Colors.white),
                      // ),
                      GButton(
                        icon: Icons.library_music_rounded,
                        text: 'Library',
                        textStyle: TextStyle(fontSize: 20, color: kwhite),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
