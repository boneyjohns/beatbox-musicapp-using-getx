// ignore_for_file: must_be_immutable

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/function/db_functions.dart';
import 'package:beat_box/screens/likedsongs/likedsongs.dart';
import 'package:beat_box/widgets/libraryiconbutton.dart';
import 'package:beat_box/widgets/miniplayer.dart';
import 'package:beat_box/widgets/playlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../database/model/hive_model.dart';
import '../../widgets/homeAllList.dart';

class Library extends StatelessWidget {
  Library({super.key});
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();
  final String playlistName = 'Most Played';
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  @override
  Widget build(BuildContext context) {
    return ListView(physics: const BouncingScrollPhysics(), children: [
      Column(
        children: [
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Mylibrarybutton(
                ontap: () {
                  Get.to(ScreenFavourites(
                    playlistName: 'Favourites',
                  ));
                },
                buttonname: 'Liked Songs',
              ),
              Mylibrarybutton(
                ontap: () {
                  Get.to(Screenplaylist());
                },
                buttonname: 'Playlist',
              ),
            ],
          ),
          kheight20,
          Center(
            child: Mylibrarybutton(
              ontap: () {
                Get.to(ScreenFavourites(
                  playlistName: 'Recent',
                ));
              },
              buttonname: 'Recent Songs',
            ),
          ),
          kheight20,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Most Played', style: kscafoldtextstyle),
          ]),
          kheight20,
          SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: ValueListenableBuilder(
                valueListenable: playlistBox.listenable(),
                builder:
                    (BuildContext context, Box<List> value, Widget? child) {
                  List<Songs> songList =
                      playlistBox.get(playlistName)!.toList().cast<Songs>();
                  return (songList.isEmpty)
                      ? const Center(
                          child: Text('No Songs Found'),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: songList.length,
                          itemBuilder: (context, index) {
                            return Homesongs(
                              onPressed: () {
                                Miniplayer(
                                  audioPlayer: audioPlayer,
                                  index: index,
                                  songList: songList,
                                );
                              },
                              songList: songList,
                              index: index,
                              audioPlayer: audioPlayer,
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
