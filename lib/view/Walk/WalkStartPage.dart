import 'package:animal_app/view/Walk/WalkAdjustRoute.dart';
import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import '../../model/Animal.dart';
import 'WalkScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class WalkStartPage extends StatefulWidget {
  const WalkStartPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WalkStartPage();
}

class _WalkStartPage extends State<WalkStartPage> {
  Future<void> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;
    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      print('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      requestLocationPermission();
      print('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  @override
  void initState() {
    requestLocationPermission();
    super.initState();
  }

  // biezremy data z db o spacerach
  bool? ograniczonyCzasSpaceru = false;
  bool? autodopasowanieTrasySpaceru = false;
  int liczbaMinut = 1;
  double containerHeight = .075;

  List<Animal> petList = [
    Animal(1, 'Kubuś', 'Fajny zwierz', DateTime.now(), 'Pies', 15.0,
        'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Animal(2, 'Nosek', 'Fajny zwierz', DateTime.now(), 'Pies', 15.0,
        'https://th.bing.com/th/id/OIP.yq2bJZuTLQft8VH64qWKugHaE9?pid=ImgDet&w=3706&h=2480&rs=1'),
    Animal(3, 'Nosek', 'Fajny zwierz', DateTime.now(), 'Pies', 15.0,
        'https://th.bing.com/th/id/OIP.yq2bJZuTLQft8VH64qWKugHaE9?pid=ImgDet&w=3706&h=2480&rs=1'),
    Animal(4, 'Nosek', 'Fajny zwierz', DateTime.now(), 'Pies', 15.0,
        'https://th.bing.com/th/id/OIP.yq2bJZuTLQft8VH64qWKugHaE9?pid=ImgDet&w=3706&h=2480&rs=1'),
    Animal(5, 'Nosek', 'Fajny zwierz', DateTime.now(), 'Pies', 15.0,
        'https://th.bing.com/th/id/OIP.yq2bJZuTLQft8VH64qWKugHaE9?pid=ImgDet&w=3706&h=2480&rs=1'),
  ];
  List<bool> wybrany = [true, false, false, false, false];

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Text(
        "Uwaga!",
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
      content: Text(
        "Aby rozpocząć spacer musisz wybrać przynajmniej jednego pupila z listy.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: <Widget>[
        Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Ok",
                  style: Theme.of(context).textTheme.headline3,
                )))
      ],
    );
  }

  void _scaleDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> walk = [
      ElevatedButton(
          onPressed: requestLocationPermission,
          child: Text('Request location')),
      SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .35,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: petList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () =>
                        setState(() => wybrany[index] = !wybrany[index]),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 40, 10, 5),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 31, 104, 60),
                              border: wybrany[index]
                                  ? Border.all(
                                      width: 3, color: Colors.greenAccent)
                                  : Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context).focusColor,
                                    blurRadius: 5)
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.only(top: 45),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.black26,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2,
                                            color:
                                                Theme.of(context).canvasColor)),
                                    child: Text(
                                      petList[index].name,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    child: Text(
                                      'Spacery: x\nDziś: 4/5 km',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                ],
                              ))),
                      Positioned(
                          top: .0,
                          left: .0,
                          right: .0,
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(petList[index].image),
                              radius: 45,
                            ),
                          ))
                    ]));
              })),
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).canvasColor,
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * containerHeight,
        width: MediaQuery.of(context).size.width * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              value: ograniczonyCzasSpaceru,
              onChanged: ((value) => setState(() {
                    ograniczonyCzasSpaceru = value;
                    value == true
                        ? containerHeight = .15
                        : containerHeight = .075;
                  })),
              title: Text(
                'Mam ograniczony czas',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            ograniczonyCzasSpaceru == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () => setState(
                              () => liczbaMinut > 10 ? liczbaMinut-- : null),
                          icon: const Icon(Icons.remove_circle_outline)),
                      Container(
                        //decoration: ,
                        alignment: Alignment.center,
                        child: Text('$liczbaMinut minut'),
                      ),
                      IconButton(
                          onPressed: () => setState(() => liczbaMinut++),
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).canvasColor,
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.075,
        width: MediaQuery.of(context).size.width * .8,
        child: CheckboxListTile(
          value: autodopasowanieTrasySpaceru,
          onChanged: ((value) =>
              setState(() => autodopasowanieTrasySpaceru = value)),
          title: Text(
            'Autodopasowanie trasy',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      Center(
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
            List<int> passAnimals = [];
            for (var i = 0; i < petList.length; i++) {
              if (wybrany[i]) {
                passAnimals.add(petList[i].id);
              }
            }
            if (passAnimals.isEmpty) {
              // brak zaznaczonych zwierzat - nie mozemy przejsc dalej
              _scaleDialog();
            } else {
              if (autodopasowanieTrasySpaceru == true) {
                if (ograniczonyCzasSpaceru == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkAdjustRoute(
                                timeInMinutes: liczbaMinut,
                                animalId: passAnimals,
                              )));
                } else {
                  // czas == false
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkAdjustRoute(
                                timeInMinutes: null,
                                animalId: passAnimals,
                              )));
                }
              } else {
                if (ograniczonyCzasSpaceru == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkScreen(
                                timeInMinutes: liczbaMinut,
                                animalId: passAnimals,
                              )));
                } else {
                  // czas == false
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkScreen(
                                timeInMinutes: null,
                                animalId: passAnimals,
                              )));
                }
              }
            }
            setState(() {});
          },
          label: Text(
            autodopasowanieTrasySpaceru!
                ? 'Przejdź Dalej>>>'
                : 'Zacznij spacer >>>',
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
    ];
    return ScaffoldClass(
        key: UniqueKey(),
        axis: true,
        appBarIcon: false,
        appBarText: 'Rozpocznij spacer',
        children: walk);
  }
}
