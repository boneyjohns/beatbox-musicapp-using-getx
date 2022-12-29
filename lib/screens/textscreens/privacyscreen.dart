import 'package:beat_box/const/const.dart';
import 'package:beat_box/screens/text/privacy.dart';
import 'package:beat_box/screens/text/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ScreenSettingTile extends StatelessWidget {
  ScreenSettingTile({super.key, required this.screenName});
  final String screenName;
  String? screenContent;

  @override
  Widget build(BuildContext context) {
    screenContent =
        screenName == 'PrivacyPolicy' ? PrivacyPolicy : TermsAndConditions;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kwhite,
          ),
          onPressed: () {
            //Navigator.pushReplacement(
            //   context, MaterialPageRoute(builder: (ctx) => NavigationPage()));
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: kblack,
        elevation: 0,
        shape: kappbarshape,
        title: Text(screenName, style: kmaintextstyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Html(data: screenContent),
        ),
      ),
    );
  }
}
