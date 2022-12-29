import 'package:beat_box/const/const.dart';
import 'package:flutter/material.dart';

class Homeicons extends StatelessWidget {
  final String playlistname;
  final dynamic imagepath;
  final Function() ontap;
  const Homeicons({
    super.key,
    required this.playlistname,
    required this.imagepath,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: SizedBox(
          width: 170,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 140,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            kheight10,
            Text(playlistname, style: kscafoldtextstyle)
          ]),
        ),
      ),
    );
  }
}
