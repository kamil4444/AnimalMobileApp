import 'package:animal_app/view/Walk/WalkSettings.dart';
import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:slider_button/slider_button.dart';

class WalkAdjustRoute extends StatefulWidget {
  const WalkAdjustRoute({Key? key, this.timeInMinutes, required this.animalId})
      : super(key: key);
  final int? timeInMinutes;
  final List<int> animalId;
  @override
  State<StatefulWidget> createState() => _WalkAdjustRoute();
}

class _WalkAdjustRoute extends State<WalkAdjustRoute> {
  List<bool> czyKlikniety = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    List<String> listaMiejsc = [
      'Sklepy',
      'Zwierzęta',
      'Parki',
      'Restauracje',
      'Od A do B',
      'Od A do A'
    ];
    List<dynamic> listaIkon = [
      Icons.shopping_cart_outlined,
      Icons.pets,
      Icons.park,
      Icons.restaurant,
      Icons.timeline,
      Icons.radio_button_unchecked
    ];

    List<Widget> miejsca = [];
    var style = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    for (var i = 0; i < 6; i++) {
      miejsca.add(
        SizedBox(
          width: i < 4 ? size.width * .35 : size.width * .30,
          height: i < 4 ? size.height * .15 : size.height * .20,
          child: GestureDetector(
              onTap: () {
                setState(() => czyKlikniety[i] = !czyKlikniety[i]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalkSettings()));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).canvasColor,
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Theme.of(context).focusColor,
                  border: Border.all(
                      width: !czyKlikniety[i] ? 1 : 5,
                      color:
                          !czyKlikniety[i] ? Colors.black : Colors.lightGreen),
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      listaIkon[i],
                      size: i > 3 ? 90 : 55,
                      color: const Color.fromARGB(255, 31, 104, 60),
                    ),
                    Text(
                      listaMiejsc[i],
                      style: style.headline3,
                    ),
                  ],
                ),
              )),
        ),
      );
    }
    return ScaffoldClass(
      axis: false,
      appBarIcon: false,
      appBarText: 'Autodopasowanie trasy',
      children: [
        Center(
          heightFactor: 3,
          child: Text(
            'Wybierz miejsce',
            style: style.bodyLarge,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(padding: const EdgeInsets.all(10), child: miejsca[0]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: miejsca[1],
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(padding: const EdgeInsets.all(10), child: miejsca[2]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: miejsca[3],
          ),
        ]),
        Center(
          heightFactor: 3,
          child: Text(
            'Wybierz typ trasy',
            style: style.bodyLarge,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(padding: const EdgeInsets.all(10), child: miejsca[4]),
          Padding(
            padding: const EdgeInsets.all(10),
            child: miejsca[5],
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Center(
            child: SliderButton(
              dismissible: false,
              shimmer: false,
              alignLabel: const Alignment(0.5, 0),
              boxShadow: BoxShadow(
                  color: Theme.of(context).backgroundColor, blurRadius: 10),
              //highlightedColor: Theme.of(context).canvasColor,
              width: MediaQuery.of(context).size.width * 0.8,
              backgroundColor: Theme.of(context).focusColor,
              buttonColor: Theme.of(context).canvasColor,
              action: () {
                setState(() {});
              },
              label: Text(
                'Zacznij spacer >>>',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              icon: const ImageIcon(
                AssetImage('assets/running_dog.png'),
                size: 50,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
