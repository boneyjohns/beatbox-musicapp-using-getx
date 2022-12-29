import 'package:beat_box/database/model/hive_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<List> getPlaylistBox() {
  return Hive.box<List>('Playlist');
}

Box<Songs> getSongBox() {
  return Hive.box<Songs>('Songs');
}

// class DbController extends GetxController {

//   }

