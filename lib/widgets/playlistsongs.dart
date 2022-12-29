import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/model/hive_model.dart';
import 'package:beat_box/functions/favorate_function.dart';
import 'package:beat_box/functions/recentsongs.dart';
import 'package:beat_box/functions/playlist.dart';
import 'package:beat_box/widgets/miniplayer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Librarysongs extends StatefulWidget {
  const Librarysongs(
      {super.key,
      required this.index,
      required this.audioPlayer,
      required this.songList,
      required this.playlistname});

  final int index;
  final AssetsAudioPlayer audioPlayer;
  final List<Songs> songList;
  final String playlistname;
  @override
  State<Librarysongs> createState() => _LibrarysongsState();
}

class _LibrarysongsState extends State<Librarysongs> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Favourites.isThisFavourite(id: widget.songList[widget.index].id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Recents.addSongsToRecents(songId: widget.songList[widget.index].id);
        showBottomSheet(
            backgroundColor: knavbar,
            context: context,
            builder: (ctx) => Miniplayer(
                  index: widget.index,
                  songList: widget.songList,
                  audioPlayer: widget.audioPlayer,
                ));
      },
      child: Card(
        shape: null,
        elevation: 0,
        color: kwhite.withOpacity(0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(50),
            ),
            color: klightblue,
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
                width: 60,
                child: QueryArtworkWidget(
                  artworkBorder: BorderRadius.circular(10),
                  id: int.parse(widget.songList[widget.index].id),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'lib/asset/playing image.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.songList[widget.index].songname,
                      style: kmyliststyle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                    Text(widget.songList[widget.index].songartist,
                        style: kmyliststyle,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Favourites.addSongToFavourites(
                    context: context,
                    id: widget.songList[widget.index].id,
                  );
                  setState(() {
                    Favourites.isThisFavourite(
                      id: widget.songList[widget.index].id,
                    );
                  });
                },
                icon: Icon(
                  Favourites.isThisFavourite(
                    id: widget.songList[widget.index].id,
                  ),
                  color: kblack,
                  size: 25,
                ),
              ),
              IconButton(
                  onPressed: () {
                    UserPlaylist.deleteFromPlaylist(
                      context: context,
                      songId: widget.songList[widget.index].id,
                      playlistName: widget.playlistname,
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
