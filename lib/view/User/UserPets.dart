import 'package:animal_app/widget/ListTileClass.dart';
import 'package:flutter/material.dart';
import '../../widget/ScaffoldClass.dart';

class MyPets extends StatefulWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  State<MyPets> createState() => _MyPets();
}

class _MyPets extends State<MyPets> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldClass(
      appBarIcon: false,
      appBarText: 'Podopieczni',
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Dog_training.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Center(
            child: Text(
              'tu username',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            'Twoi podopieczni',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const ListTileClass(),
      ],
    );
  }
}
