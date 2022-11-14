import 'package:animal_app/view/User/UserAccount.dart';
import 'package:animal_app/view/User/Start.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerBar extends StatefulWidget {
  @override
  State<DrawerBar> createState() => _DrawerBar();

  DrawerBar({Key? key}) : super(key: key);
}

class _DrawerBar extends State<DrawerBar> {
  final int _index = 0;
  final _drawerItems = [
    DrawerItem("Account", Icons.account_circle_sharp),
    DrawerItem("Activity", Icons.directions_run_sharp),
    DrawerItem("Chat", Icons.wechat_sharp),
    DrawerItem("Friends", Icons.supervisor_account_sharp),
    DrawerItem("Settings", Icons.settings_accessibility_sharp),
    DrawerItem("Information", Icons.info_outline_rounded),
    DrawerItem("Logout", Icons.logout_sharp),
  ];
  _navigateClearRoute(Widget route) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => route,
      ),
      (route) => false,
    );
  }

  _onSelectItem(int index) {
    switch (index) {

      // Account
      case 0:
        return _navigateClearRoute(const UserAccount());

      // Activity
      case 1:
      //return Start();

      // Chat
      case 2:
      //return Start();

      // Friends
      case 3:
      //return Start();

      // Settings
      case 4:
      //return Start();

      // Information
      case 5:
      //return Start();

      // Logout
      case 6:
        return _navigateClearRoute(const StartPage()); //Login

      default:
      //return Start();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < _drawerItems.length; i++) {
      var d = _drawerItems[i];
      drawerOptions.add(Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(
                  45,
                ),
              ),
              child: ListTile(
                title: Text(
                  d.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                trailing: Icon(
                  d.icon,
                  size: Theme.of(context).iconTheme.size,
                  color: Colors.black87,
                ),
                selected: i == _index,
                onTap: () => _onSelectItem(i),
              ))));
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Column(children: drawerOptions)],
        ),
      ),
    );
  }
}
