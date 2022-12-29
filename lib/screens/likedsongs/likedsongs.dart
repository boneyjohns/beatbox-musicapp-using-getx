import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/function/db_functions.dart';
import 'package:beat_box/database/model/hive_model.dart';
import 'package:beat_box/widgets/homealllist.dart';
import 'package:beat_box/widgets/miniplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class ScreenFavourites extends StatelessWidget {
  ScreenFavourites({super.key, required this.playlistName});
  final String playlistName;
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: kblack,
        shape: kappbarshape,
        title: Text(playlistName, style: kmaintextstyle),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ValueListenableBuilder(
          valueListenable: playlistBox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            List<Songs> songList =
                playlistBox.get(playlistName)!.toList().cast<Songs>();
            return (songList.isEmpty)
                ? const Center(
                    child: Text('No Songs Found'),
                  )
                : ListView.builder(
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
    );
  }
}
