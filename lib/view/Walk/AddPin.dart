import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';

class AddPin extends StatefulWidget {
  const AddPin({Key? key, required this.animalId, required this.latLng})
      : super(key: key);
  final LatLng latLng;
  final List<int> animalId;
  @override
  State<StatefulWidget> createState() => _AddPin();
}

class _AddPin extends State<AddPin> {
  String _nazwaMiejsca = '', _opisMiejsca = '';

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Dodaj koordynaty miejsca",
            style: style.bodyLarge,
          ),
        ),
        body: Column(
          children: [
            Text(
              'Długość geograficzna',
              style: style.bodyMedium,
            ),
            TextFormField(
              enabled: false,
              initialValue: widget.latLng.latitude.toString(),
            ),
            Text(
              'Szerokość geograficzna',
              style: style.bodyMedium,
            ),
            TextFormField(
              enabled: false,
              initialValue: widget.latLng.longitude.toString(),
            ),
            Text(
              'Nazwa miejsca',
              style: style.bodyMedium,
            ),
            TextFormField(
                onChanged: (value) => setState(() {
                      _nazwaMiejsca = value;
                    })),
            Text(
              'Opis miejsca',
              style: style.bodyMedium,
            ),
            TextFormField(
              onChanged: (value) => setState(() {
                _opisMiejsca = value;
              }),
              maxLength: 255,
              maxLines: 6,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, _nazwaMiejsca),
                child: Text(
                  'Zapisz',
                  style: style.headline3,
                ))
          ],
        ));
  }
}
