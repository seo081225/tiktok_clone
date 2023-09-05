import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone_2023/constants/gaps.dart';
import 'package:tiktok_clone_2023/constants/sizes.dart';
import 'package:tiktok_clone_2023/threads/privacy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.chevronLeft,
                size: Sizes.size18,
              ),
              Gaps.h8,
              Text(
                'Back',
                style: TextStyle(fontSize: Sizes.size18),
              ),
            ],
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: Sizes.size20, fontWeight: FontWeight.w700),
        ),
        elevation: 0.1,
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.userPlus,
              ),
            ),
            title: Text("Follow and invite friends"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.bell,
              ),
            ),
            title: Text("Notifications"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PrivacyScreen(),
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.lock,
              ),
            ),
            title: const Text("Privacy"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.solidCircleUser,
              ),
            ),
            title: Text("Account"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.lifeRing,
              ),
            ),
            title: Text("Help"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const ListTile(
            leading: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FaIcon(
                FontAwesomeIcons.circleInfo,
              ),
            ),
            title: Text("About"),
            iconColor: Colors.black,
            textColor: Colors.black,
            titleAlignment: ListTileTitleAlignment.center,
          ),
          const Divider(
            height: 10,
          ),
          CupertinoButton(
            onPressed: () => _showAlertDialog(context),
            alignment: Alignment.centerLeft,
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text("Log out"),
      content: const Text("Are you sure want to log out?"),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          /// This parameter indicates this action is the default,
          /// and turns the action's text to bold text.
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
