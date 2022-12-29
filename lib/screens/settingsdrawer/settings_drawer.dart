import 'package:beat_box/const/const.dart';
import 'package:beat_box/screens/textscreens/privacyscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SettingsDrawer extends StatelessWidget {
  SettingsDrawer({super.key});

  bool newvalue = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: kblack,
        child: SafeArea(
            child: Column(children: [
          Text('Settings', style: kmaintextstyle),
          InkWell(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Column(
                        children: [
                          Text(
                            "BEAT BOX",
                            style: const TextStyle(
                                fontFamily: "poppinz",
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            selectionColor: klightblue,
                          ),
                          const Text('1.0.0')
                        ],
                      ),
                      content: const Text(
                          'BEAT BOX is designed and developed by\n BONEY JOHNS'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ListTile(
                  leading: Icon(Icons.info, color: kwhite),
                  title: Text('About Us', style: TextStyle(color: kwhite)))),
          Divider(height: 10),
          ListTile(
              leading: Icon(Icons.notifications, color: kwhite),
              title: Text('Notification', style: TextStyle(color: kwhite)),
              trailing: Switch(
                  value: newvalue,
                  onChanged: (newvalue) {
                    newvalue = false;
                  })),
          const Divider(height: 10),
          const ListTile(
            leading: Icon(Icons.share, color: kwhite),
            title: Text('Share', style: TextStyle(color: kwhite)),
          ),
          const Divider(height: 10),
          ListTile(
              leading: Icon(Icons.health_and_safety, color: kwhite),
              title: Text('Privacy policy', style: TextStyle(color: kwhite)),
              onTap: () {
                Get.to(ScreenSettingTile(
                  screenName: "PrivacyPolicy",
                ));
              }),
          const Divider(
            height: 10,
          ),
          ListTile(
              leading: Icon(Icons.gavel_rounded, color: kwhite),
              title:
                  Text('TermsAndConditions', style: TextStyle(color: kwhite)),
              onTap: () {
                Get.to(ScreenSettingTile(
                  screenName: "Terms&Conditions",
                ));
              })
        ])));
  }
}
