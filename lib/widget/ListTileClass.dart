import 'package:animal_app/view/Pet/PetDetails.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../view/Pet/AddPet.dart';

class ListTileClass extends StatelessWidget {
  //fetch animal image etc from db and pass at constructor
  const ListTileClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // tutaj petla foreach
    List<Widget> pets = [];
    for (var i = 0; i < 4; i++) {
      pets.add(GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PetDetails())),
        child: GFListTile(
          color: Theme.of(context).bottomAppBarColor,
          avatar: const GFAvatar(
            size: 50,
            backgroundImage: AssetImage('assets/Dog_black.png'),
          ),
          title: Text(
            'nazwa + data urodzenia',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subTitle: Text(
            'rasa',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          //icon: Icon(Icons.favorite, color: Colors.red)
        ),
      ));
    }
    pets.add(GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AddPet())),
      child: GFListTile(
        color: Theme.of(context).bottomAppBarColor,
        avatar: const GFAvatar(
            size: 50,
            backgroundImage: AssetImage('assets/Dog_black.png'),
            child: SizedBox(
                width: 80,
                height: 80,
                child: Image(
                  image: AssetImage('assets/add.png'),
                  alignment: Alignment.bottomRight,
                ))),
        title: Text(
          'Dodaj nowego zwierzaka',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    ));
    return Expanded(
        child: SingleChildScrollView(
            child: Column(
      children: pets,
    )));
  }
}
