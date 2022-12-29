import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/model/hive_model.dart';
import 'package:beat_box/screens/navigationpage/navigation_page.dart';
import 'package:beat_box/widgets/homeAllList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../functions/favorate_function.dart';
import '../scarchscreen/scarch_screen.dart';

class Nowplaying extends StatelessWidget {
  Nowplaying({
    required this.songaudio,
    required this.index,
    required this.audioPlayer,
    required this.id,
    super.key,
  });
  final List<Audio> songaudio;
  final int index;
  final String id;
  final AssetsAudioPlayer audioPlayer;
  var isLoop = true;
  bool isShuffle = true;

  // void shuffleButtonPressed() {
  //   setState(() {
  //     audioPlayer.toggleShuffle();
  //     isShuffle = !isShuffle;
  //   });
  // }

  void repeatButtonPressed() {
    if (isLoop == true) {
      audioPlayer.setLoopMode(LoopMode.single);
    } else {
      audioPlayer.setLoopMode(LoopMode.playlist);
    }
    // setState(() {
    //   isLoop = !isLoop;
    // });
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) {
      return element.path == fromPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return audioPlayer.builderCurrent(builder: (context, playing) {
      final myAudio = find(songaudio, playing.audio.assetAudioPath);
      final Size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Get.back()),
          backgroundColor: kblack,
          shape: kappbarshape,
          title: Text('BEAT BOX', style: kmaintextstyle),
          centerTitle: true,
          toolbarHeight: Size.height * 0.08,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(Searchbar());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Column(children: [
          SizedBox(height: Size.height * 0.01),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Mynowplayingbutton(
              onPressed: () {
                final song = Songs(
                  id: myAudio.metas.id!,
                  songname: myAudio.metas.title!,
                  songartist: myAudio.metas.artist!,
                  path: myAudio.path,
                );

                showPlaylistModalSheet(
                  context: context,
                  song: song,
                );
              },
              nowplayingbutton: Icons.add,
            ),
            SizedBox(
              width: Size.width * 0.2,
            ),
            Mynowplayingbutton(
              nowplayingbutton:
                  Favourites.isThisFavourite(id: myAudio.metas.id!),
              onPressed: () {
                Favourites.addSongToFavourites(
                  context: context,
                  id: myAudio.metas.id!,
                );
              },
            ),
            // SizedBox(
            //   width: 20,
            // ),
          ]),
          SizedBox(height: Size.height * 0.02),
          SizedBox(
            width: Size.width * 0.9,
            height: Size.height * 0.4,
            child: QueryArtworkWidget(
              artworkBorder: BorderRadius.circular(50),
              id: int.parse(myAudio.metas.id!),
              type: ArtworkType.AUDIO,
              nullArtworkWidget: Image.asset(
                'lib/asset/frog.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: Size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(
                    audioPlayer.getCurrentAudioTitle,
                    style: kmyliststyle,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
                  Center(
                      child: Text(audioPlayer.getCurrentAudioArtist,
                          style: kmyliststyle)),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 40, right: 40, top: 10),
            child: audioPlayer.builderRealtimePlayingInfos(
                builder: (context, info) {
              final duration = info.current!.audio.duration;
              final position = info.currentPosition;
              {
                return ProgressBar(
                  progress: position,
                  total: duration,
                  barCapShape: BarCapShape.round,
                  barHeight: 5,
                  baseBarColor: Color.fromARGB(255, 55, 126, 87),
                  thumbColor: klightblue,
                  progressBarColor: klightblue,
                  thumbGlowColor: kwhite,
                  thumbGlowRadius: 20,
                  thumbRadius: 15,
                  timeLabelTextStyle: TextStyle(color: kblack),
                  timeLabelPadding: 10,
                  onSeek: (duration) {
                    audioPlayer.seek(duration);
                  },
                );
              }
            }),
          ),
          SizedBox(height: Size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Mynowplayingbutton(
                nowplayingbutton:
                    (isLoop == true) ? Icons.repeat : Icons.repeat_one,
                onPressed: () {
                  repeatButtonPressed();
                },
              ),
              Mynowplayingbutton(
                  nowplayingbutton: Icons.skip_previous,
                  onPressed: () async {
                    await audioPlayer.previous();
                  }),
              PlayerBuilder.isPlaying(
                  player: audioPlayer,
                  builder: (context, isPlaying) {
                    return Mynowplayingbutton(
                      nowplayingbutton:
                          (isPlaying == true) ? Icons.pause : Icons.play_arrow,
                      onPressed: () async {
                        await audioPlayer.playOrPause();
                      },
                    );
                  }),
              Mynowplayingbutton(
                  nowplayingbutton: Icons.skip_next,
                  onPressed: () async {
                    await audioPlayer.next();
                  }),
              Mynowplayingbutton(
                nowplayingbutton:
                    (isShuffle == true) ? Icons.shuffle : Icons.arrow_forward,
                onPressed: () {
                  //               shuffleButtonPressed();
                },
              ),
            ],
          )
        ]),
      );
    });
  }
}

class Mynowplayingbutton extends StatelessWidget {
  const Mynowplayingbutton(
      {super.key, required this.nowplayingbutton, required this.onPressed});
  final IconData nowplayingbutton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Container(
          decoration: const BoxDecoration(
              color: klightblue,
              borderRadius: BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 119, 182, 145),
                    offset: Offset(4.5, 4.5),
                    blurRadius: 15.5,
                    spreadRadius: 3),
                BoxShadow(
                    color: Color.fromARGB(179, 36, 33, 33),
                    offset: Offset(-4.5, -4.5),
                    blurRadius: 15.5,
                    spreadRadius: 3),
              ]),
          width: 60,
          child: IconButton(
              icon: Icon(
                nowplayingbutton,
                size: 30,
                color: kblack,
              ),
              onPressed: onPressed),
        ));
  }
}
