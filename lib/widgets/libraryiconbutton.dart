import 'package:beat_box/const/const.dart';
import 'package:flutter/material.dart';

class Mylibrarybutton extends StatelessWidget {
  const Mylibrarybutton({
    super.key,
    required this.buttonname,
    required this.ontap,
  });
  final String buttonname;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
          color: klightblue,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: const [
            BoxShadow(
                color: kblack,
                offset: Offset(4.5, 4.5),
                blurRadius: 15.5,
                spreadRadius: 3),
            BoxShadow(
                color: kwhite,
                offset: Offset(-4.5, -4.5),
                blurRadius: 15.5,
                spreadRadius: 3),
          ]),
      child: TextButton(
          onPressed: ontap,
          child: Text(
            buttonname,
            style: kmyliststyle,
          )),
    );
  }
}
