import 'package:abnet/screen/wudasie_in_geez/wudasie_in_geez.dart';
import 'package:abnet/utils/styles.dart';
import 'package:flutter/material.dart';

import '../screen/about.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: kPrimaryLight),
          child: Text('የኔታ'),
        ),
        ListTile(title: const Text('አብነት'), onTap: () {}),
        ListTile(title: const Text('ውዳሴ ማርያም በአማርኛ'), onTap: () {}),
        ListTile(
            title: const Text('ውዳሴ ማርያም በግእዝ'),
            onTap: () {
              Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const WudasieInGeez()));
            }),
        ListTile(title: const Text('መቼት'), onTap: () {}),
        ListTile(title: const Text('ስለ'), onTap: () {
            Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const About()));
        }),
      ],
    ));
  }
}
