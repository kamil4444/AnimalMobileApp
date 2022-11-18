import 'package:animal_app/view/Walk/WalkStartPage.dart';
import 'package:animal_app/widget/DrawerItem.dart';
import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:flutter/material.dart';

/*
Uzupelnic destynacje do kontenerow  Walk + Explore + Gallery + Events
Uzupelnic destynacje do Drawer - account activity etc
Destynacja dzwonek, + , lupa
*/

class UserStartPage extends StatefulWidget {
  const UserStartPage({Key? key}) : super(key: key);

  @override
  State<UserStartPage> createState() => _UserStartPage();
}

class _UserStartPage extends State<UserStartPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldClass(
      axis: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Dog_training.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Center(
            child: Text(
              "Good to see you, _userName!\n You have _coins coins.",
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalkStartPage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child: Text(
                      'Walk',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child: Text(
                      'Explore',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child: Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Center(
                    child: Text(
                      'Events',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
