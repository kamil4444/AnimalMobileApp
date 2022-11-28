import 'package:animal_app/view/User/UserStartPage.dart';
import 'package:animal_app/widget/DrawerItem.dart';
import 'package:flutter/material.dart';

class ScaffoldClass extends StatelessWidget {
  const ScaffoldClass(
      {Key? key,
      required this.children,
      this.appBarText,
      this.appBarIcon,
      required this.axis})
      : super(key: key);

  final List<Widget> children;
  final String? appBarText;
  final bool? appBarIcon;
  final bool? axis;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
         false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            title: appBarText != null ? Text(appBarText!) : const Text(''),
            leading: appBarIcon == true
                ? IconButton(
                    icon: const Icon(Icons.pets),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserStartPage())),
                  )
                : appBarIcon == null
                    ? const Text('')
                    : IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      )),
        /*
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: Theme.of(context).iconTheme.size,
                  color: Theme.of(context).iconTheme.color,
                ),
                label: 'Home',
              ),
            ]),
        */
        endDrawer: const DrawerBar(),
        body: !axis!
            ? Column(children: children)
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
              ));
  }
}
