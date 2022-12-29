import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kbackgrountcolor = Color.fromARGB(255, 174, 255, 145);

const kblack = Colors.black;
const kwhite = Colors.white;
const knavbar = Color.fromARGB(255, 119, 182, 145);
const klightblue = Color.fromARGB(255, 10, 141, 180);

const kheight20 = SizedBox(height: 20);
const kheight5 = SizedBox(height: 5);
const kheight10 = SizedBox(height: 10);

final kmaintextstyle = GoogleFonts.alfaSlabOne(
  fontSize: 22,
  color: klightblue,
  fontStyle: FontStyle.italic,
);

const kappbarshape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(30),
    top: Radius.circular(100),
  ),
);

final kscafoldtextstyle =
    GoogleFonts.prata(color: kblack, fontSize: 24, fontStyle: FontStyle.italic);
final kmyliststyle = GoogleFonts.saira(color: kblack, fontSize: 12);
final kplayliststyle =
    GoogleFonts.saira(fontSize: 20, color: kwhite, fontWeight: FontWeight.w600);
