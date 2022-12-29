import 'package:beat_box/const/const.dart';
import 'package:beat_box/database/model/hive_model.dart';
import 'package:beat_box/screens/spalshscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(SongsAdapter());
  }
  await Hive.openBox<Songs>('Songs');
  await Hive.openBox<List>('Playlist');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgrountcolor,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
