import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/function/db_functions.dart';
import 'package:beat_box/database/model/hive_model.dart';

import 'package:beat_box/screens/likedsongs/likedsongs.dart';
import 'package:beat_box/widgets/homeAllList.dart';
import 'package:beat_box/widgets/home_icons.dart';
import 'package:beat_box/widgets/playlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';

class MyHome extends StatelessWidget {
  MyHome({super.key});

  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight20,
        Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                width: 5,
              ),
              Homeicons(
                ontap: () {
                  Get.to(
                    Screenplaylist(),
                  );
                },
                playlistname: 'Playlist',
                imagepath: 'lib/asset/new.1.jpg',
              ),
              const SizedBox(
                width: 5,
              ),
              Homeicons(
                ontap: () {
                  Get.to(ScreenFavourites(
                    playlistName: 'Recent',
                  ));
                },
                playlistname: 'Recent Songs',
                imagepath: 'lib/asset/new.2.jpg',
              ),
              kheight5,
              Homeicons(
                ontap: () {
                  Get.to(ScreenFavourites(playlistName: 'Favourites'));
                },
                playlistname: 'Liked Songs',
                imagepath: 'lib/asset/new.jpg',
              )
            ],
          ),
        ),
        kheight20,
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: 35,
          ),
          Text(
            'All Songs',
            style: kscafoldtextstyle,
          ),
        ]),
        kheight10,
        Expanded(
          flex: 2,
          child: ValueListenableBuilder(
            valueListenable: songBox.listenable(),
            builder: (BuildContext context, boxSongs, _) {
              List<Songs> songList = songBox.values.toList().cast<Songs>();
              return (songList.isEmpty)
                  ? const Text("No Songs Found")
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Homesongs(
                          index: index,
                          audioPlayer: audioPlayer,
                          songList: songList,
                        );
                      },
                      itemCount: songBox.length,
                    );
            },
          ),
        )
      ],
    );
  }
}
