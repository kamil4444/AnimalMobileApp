// ignore_for_file: file_names

import 'package:animal_app/widget/ImagePickerClass.dart';
import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:flutter/material.dart';

/*
Dodać form walidację
Uzupełnić dane z bazy
Przycisk uaktualnia dane jeżeli są poprawne itp.
*/

class AddPet extends StatefulWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPet();
}

class _AddPet extends State<AddPet> {
  List<String> petData = [
    'Adrian',
    'Nowak',
    'Żalno',
    'Adrainno@żal.pl',
    '21',
    '777888999',
    'Mężczyzna'
  ];
  List<String> petFields = [
    'Wpisz imie...',
    'Wybierz rasę...',
    'Wybierz płeć...',
    'Wybierz datę urodzenia...',
    'Podaj wagę...',
    'Opowiedz krótko o swoim pupilu...',
  ];
  String date = "";
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> editableWidgets = [];
    List<String> sexOpt = ['Pies', 'Suczka'];
    List<String> breedOpt = [
      'Chart afgański',
      'Chart perski - saluki',
      'Chart rosyjski borzoj',
      // 'Sekcja 2 - Charty szorstkowłose',
      'Chart szkocki',
      'Wilczarz irlandzki',
      // 'Sekcja 3 - Charty krótkowłose',
      'Chart afrykański - azawakh',
      'Chart arabski - sloughi',
      'Chart hiszpański',
      'Chart polski',
      'Chart węgierski',
      'Charcik włoski',
      'Greyhound',
      'Whippet',
      'Bichon frise',
      'Bolończyk',
      'Hawańczyk',
      'Maltańczyk',
      'Coton de tuléar',
      'Lwi piesek',
      // Sekcja 2 – Pudle
      'Pudel duży',
      'Pudel miniaturowy',
      'Pudel średni',
      'Pudel toy',
      //Sekcja 3 – Małe psy belgijskie
      //3.1. Gryfony
      'Gryfonik belgijski ',
      'Gryfonik brukselski',
      //3.2. Brabantczyk
      'Brabantczyk',
      //Sekcja 4 – Psy bezwłose
      'Chiński grzywacz',
      //Sekcja 5 – Rasy tybetańskie
      'Lhasa apso',
      'Shih tzu',
      'Spaniel tybetański',
      'Terier tybetański',
      //Sekcja 6 - Chihuahua
      'Chihuahua',
      //Sekcja 7 - Angielskie spaniele miniaturowe
      'Cavalier king charles spaniel',
      'King charles spaniel',
      //Sekcja 8 - Chin japoński i Pekińczyk
      'Chin japoński',
      'Pekińczyk',
      //Sekcja 9 - Spaniele kontynentalne miniaturowe i Rosyjski toy
      'Rosyjski toy',
      'Spaniel kontynentalny miniaturowy',
      //Sekcja 10 - Kromfohrländer
      'Kromfohrländer',
      //Sekcja 11 - Małe molos
      'Boston terrier',
      'Buldog francuski',
      'Mops',
      'Amerykański spaniel dowodny',
      'Barbet',
      'Fryzyjski pies dowodny',
      'Hiszpański pies dowodny',
      'Irlandzki spaniel dowodny',
      'Lagotto romagnolo',
      'Portugalski pies dowodny',
      'Clumber spaniel',
      'Cocker spaniel amerykański',
      'Cocker spaniel angielski',
      'Field spaniel',
      'Kooikerhondje',
      'Płochacz niemiecki',
      'Springer spaniel angielski',
      'Springer spaniel walijski',
      'Sussex spaniel',
      'Chesapeake bay retriever',
      'Curly coated retriever',
      'Flat coated retriever',
      'Golden retriever',
      'Labrador retriever',
      'Nova scotia duck tolling retriever',
      'Seter angielski',
      'Seter irlandzki',
      'Seter irlandzki czerwono-biały',
      'Seter szkocki (gordon)',
      'Pointer',
      'Gryfon korthalsa',
      'Wyżeł czeski szorstkowłosy – fousek',
      'Wyżeł włoski szorstkowłosy',
      'Duży münsterländer',
      'Drentse Patrijshond',
      'Epagneul bleu de picardie',
      'Epagneul de pond-audemer',
      'Mały münsterländer',
      'Spaniel bretoński',
      'Spaniel francuski',
      'Spaniel pikardyjski',
      'Wyżeł fryzyjski',
      'Wyżeł niemiecki długowłosy',
      'Braque d’auvergne',
      'Braque de l’ariege',
      'Braque du bourbonnais',
      'Braque saint-germain',
      'Pudelpointer',
      'Wyżeł duński',
      'Wyżeł gaskoński',
      'Wyżeł hiszpański z Burgos',
      'Wyżeł niemiecki krótkowłosy',
      'Wyżeł niemiecki ostrowłosy',
      'Wyżeł niemiecki szorstkowłosy',
      'Wyżeł pirenejski',
      'Wyżeł weimarski',
      '• Wyżeł weimarski długowłosy',
      '• Wyżeł weimarski krótkowłosy',
      'Wyżeł węgierski krótkowłosy',
      'Wyżeł węgierski szorstkowłosy',
      'Wyżeł włoski krótkowłosy',
      'Wyżeł portugalski',
      'Wyżeł słowacki szorstkowłosy',
      'Dalmatyńczyk',
      'Rhodesian ridgeback',
      'Alpejski gończy krótkonożny',
      'Posokowiec bawarski',
      'Posokowiec hanowerski',
      'Westfalski gończy krótkonożny',
      'Basset artezyjsko-normandzki',
      'Basset bretoński',
      'Basset gaskoński',
      'Basset hound',
      'Beagle',
      'Drever',
      'Gończy niemiecki',
      'Grand basset griffon vendéen',
      'Petit basset griffon vendéen',
      'Gończy szwajcarski krótkonożny',
      'Ariégeois',
      'Beagle-harrier',
      'Chien d’artois',
      'Czarnogórski gończy górski',
      'Dunker',
      'Gończy austriacki',
      'Gończy bośniacki szorstkowłosy barak',
      'Gończy chorwacki',
      'Gończy fiński',
      'Gończy grecki',
      'Gończy hamiltona',
      'Gończy hiszpański',
      'Gończy istryjski krótkowłosy',
      'Gończy istryjski szorstkowłosy',
      'Gończy polski',
      'Gończy schillera',
      'Gończy serbski',
      'Gończy serbski trójkolorowy',
      'Gończy słowacki',
      'Gończy smalandzki',
      'Gończy styryjski',
      'Gończy szwajcarski',
      'Gończy berneński',
      'Gończy z Jury',
      'Gończy lucerneński',
      'Gończy ze Schwyz',
      'Gończy tyrolski',
      'Gończy węgierski',
      'Gończy włoski',
      'Gończy włoski krótkowłosy',
      'Gończy włoski szorstkowłosy',
      'Haldenstøvare',
      'Harrier',
      'Hygenhund',
      'Mały gończy anglo-francuski',
      'Mały gończy gaskoński',
      'Porcelaine',
      'Szorstkowłosy gończy bretoński',
      'Szorstkowłosy gończy gaskoński',
      'Szorstkowłosy gończy wandejski',
      'Szorstkowłosy gończy z Nivernais',
      'Billy',
      'Black and tan coonhound',
      'Bloodhound',
      'Duży gończy anglo-francuski biało-czarny',
      'Duży gończy anglo-francuski biało-pomarańczowy',
      'Duży gończy anglo-francuski trójkolorowy',
      'Duży gończy gaskoński',
      'Foxhound amerykański',
      'Foxhound angielski',
      'Gascon saintongeols',
      'Grand griffon vendéen',
      'Gończy francuski biało-czarny',
      'Gończy francuski biało-pomarańczowy',
      'Gończy francuski trójkolorowy',
      'Otterhound',
      'Ogar polski',

      'Poitevin',
      'Rastreador Brasileiro',
      'Taiwan dog',
      'Thai ridgeback',
      'Cirneco dell’Etna',
      'Podenco kanaryjski',
      'Podenco z Ibizy',
      'Podengo portugalski',
      'Basenji',
      'Canaan dog',
      'Pies faraona',
      'Nagi pies meksykański',
      'Nagi pies peruwiański',
      'Akita',
      'Akita amerykańska',
      'Chow chow',
      'Eurasier',
      'Hokkaïdo',
      'Jindo',
      'Kai',
      'Kishu',
      'Shiba',
      'Shikoku',
      'Szpic japoński',
      'Thai bangkaew',
      'Szpic miniaturowy (pomeranian)',
      'Szpic niemiecki duży',
      'Szpic niemiecki średni',
      'Szpic niemiecki mały',
      'Szpic wilczy',
      'Szpic włoski',
      'Islandzki szpic pasterski',
      'Lapinporokoira',
      'Norsk buhund',
      'Suomenlapinkoira',
      'Svensk lapphund',
      'Västgötaspets',
      'Elkhund czarny',
      'Elkhund szary',
      'Jämthund',
      'Karelski pies na niedźwiedzie',
      'Łajka rosyjsko-europejska',
      'Łajka wschodniosyberyjska',
      'Łajka zachodniosyberyjska',
      'Norrbottenspitz',
      'Norsk lundehund',
      'Szpic fiński',
      'Alaskan malamute',
      'Canadian Eskimo Dog',
      'Pies grenlandzki',
      'Samojed',
      'Siberian husky',
      'Jamnik standardowy',
      'Jamnik długowłosy standardowy',
      'Jamnik krótkowłosy standardowy',
      'Jamnik szorstkowłosy standardowy',
      'Jamnik króliczy',
      'Jamnik krótkowłosy króliczy',
      'Jamnik długowłosy króliczy',
      'Jamnik szorstkowłosy króliczy',
      'Jamnik miniaturowy',
      'Jamnik krótkowłosy miniaturowy',
      'Jamnik długowłosy miniaturowy',
      'Jamnik szorstkowłosy miniaturowy',
      'Australian silky terrier',
      'English toy terrier',
      'Yorkshire terrier',
      'American staffordshire terrier',
      'Bulterier',
      'Bulterier miniaturowy',
      'Staffordshire bull terrier',
      'Cairn terrier',
      'Dandie dinmont terrier',
      'Jack russell terrier',
      'Norfolk terrier',
      'Norwich terrier',
      'Sealyham terrier',
      'Skye terrier',
      'Terier australijski',
      'Terier czeski',
      'Terier japoński',
      'Terier szkocki',
      'West highland white terrier',
      'Airedale terrier',
      'Bedlington terrier',
      'Border terrier',
      'Foksterier krótkowłosy',
      'Foksterier szorstkowłosy',
      'Irish glen of imaal terrier',
      'Irish soft coated wheaten terrier',
      'Kerry blue terrier',
      'Lakeland terrier',
      'Manchester terrier',
      'Niemiecki terier myśliwski',
      'Parson russell terrier',
      'Terier brazylijski',
      'Terier irlandzki',
      'Terier walijski',
      'Appenzeller',
      'Berneński pies pasterski',
      'Duży szwajcarski pies pasterski',
      'Entlebucher',
      'Aidi',
      'Anatolian',
      'Bernardyn',
      'Cão da serra da estrela',
      'Cão de castro laboreiro',
      'Hovawart',
      'Sarplaninac',
      'Kraski owczarek',
      'Landseer (typ kontynentalno-europejski)',
      'Leonberger',
      'Mastif hiszpański',
      'Mastif pirenejski',
      'Mastif tybetański',
      'Nowofundland',
      'Owczarek kaukaski',
      'Owczarek środkowoazjatycki',
      'Pies pasterski z Bukowiny',
      'Pirenejski pies górski',
      'Rafeiro do alentejo',
      'Tornjak',
      'Bokser',
      'Buldog angielski',
      'Bullmastif',
      'Broholmer',
      'Cane corso italiano',
      'Cão fila de são miguel',
      'Cimarrón uruguayo',
      'Dog argentyński',
      'Dog kanaryjski',
      'Dog niemiecki',
      'Dog z Majorki',
      'Dogue de bordeaux',
      'Fila brasileiro',
      'Mastif angielski',
      'Mastif neapolitański',
      'Rottweiler',
      'Shar pei',
      'Tosa',
      'Czarny terier rosyjski',
      'Hollandse smoushond',
      'Sznaucer olbrzym',
      'Sznaucer miniaturowy',
      'Sznaucer średni',
      'Doberman',
      'Duńsko-szwedzki pies wiejski',
      'Pinczer austriacki',
      'Pinczer małpi',
      'Pinczer miniaturowy',
      'Pinczer średni',
      'Australian cattle dog',
      'Bouvier des Ardennes',
      'Bouvier des Flandres',
      'Bearded collie',
      'Bergamasco',
      'Biały owczarek szwajcarski',
      'Border collie',
      'Czuwacz słowacki',
      'Komondor',
      'Kuvasz',
      'Maremmano-abruzzese',
      'Mudi',
      'Schapendoes',
      'Owczarek australijski (typ amerykański)',
      'Owczarek australijski kelpie',
      'Owczarek belgijski',
      'Owczarek chorwacki',
      'Owczarek francuski beauceron',
      'Owczarek francuski briard',
      'Owczarek holenderski',
      'Owczarek kataloński',
      'Owczarek niemiecki',
      'Owczarek pikardyjski',
      'Owczarek pirenejski długowłosy',
      'Owczarek pirenejski o gładkiej kufie',
      'Owczarek południoworosyjski jużak',
      'Owczarek portugalski',
      'Owczarek rumuński karpatin',
      'Owczarek rumuński mioritic',
      'Owczarek staroangielski bobtail',
      'Owczarek szetlandzki',
      'Owczarek szkocki długowłosy',
      'Owczarek szkocki krótkowłosy',
      'Owczarek z Majorki',
      'Polski owczarek nizinny',
      'Polski owczarek podhalański',
      'Puli',
      'Pumi',
      'Saarlooswolfhond',
      'Schipperke',
      'Welsh corgi cardigan',
      'Welsh corgi pembroke',
      'Wilczak czechosłowacki',
    ];
    for (var i = 0; i < petFields.length; i++) {
      editableWidgets.add(i == 1 || i == 2
          ? Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    List<String> opt;
                    i == 1 ? opt = breedOpt : opt = sexOpt;
                    return opt.where(
                      (String option) {
                        return option
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      },
                    );
                  },
                  displayStringForOption: (String option) => option,
                  fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) {
                    return TextFormField(
                      //keyboardType: TextInputType.multiline,
                      //maxLines: 6,
                      //maxLength: 255,
                      focusNode: focusNode,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        labelText: petFields[i],
                      ),
                    );
                  }),
            )
          : i == 3
              ? ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Podaj datę urodzin twojego pupila!'))
              : Text('datej'));
    }
    return ScaffoldClass(
        appBarText: 'Dodaj nowego pupila',
        appBarIcon: false,
        children: [
          const ImagePickerClass(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: editableWidgets,
              ),
            ),
          ),
        ]);
  }
}
