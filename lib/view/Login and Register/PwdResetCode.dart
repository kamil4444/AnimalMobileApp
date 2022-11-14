import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'PwdResetFinal.dart';

class PwdResetCode extends StatefulWidget {
  //deklaracja zmiennej przechowujacej kod
  final String code;
  const PwdResetCode({Key? key, required this.code}) : super(key: key);

  @override
  State<PwdResetCode> createState() => _PwdResetCode();
}

class _PwdResetCode extends State<PwdResetCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _receivedCode = "";
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  TextFormField RightCode(params) {
    return TextFormField();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Logowanie.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 200,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Paw Paw',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                'Reset your password',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),

            /*IconButton(
              icon: const Icon(
                Icons.question_mark_outlined,
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'AlertDialog Title',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  content: Text(
                    'Please, let us verify who you are! Fill the email box and click "Send the code". It will appear within 5 minutes at your email box.',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),*/

            Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => _receivedCode = value,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.numbers_rounded,
                          color: IconTheme.of(context).color,
                          size: IconTheme.of(context).size,
                        ),
                      ),
                      validator: (value) {
                        print(value! + widget.code);
                        if (value == null || value.isEmpty) {
                          return 'Please enter the code before proceeding.';
                          // ignore: valid_regexps
                        } else if (!(RegExp(r'^([0-9]{5}$)')).hasMatch(value)) {
                          return 'Not a vaild code!';
                        } else if (value != widget.code) {
                          return 'This code doesn\'t match';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Code\'s not here? Tap for another.',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: ElevatedButton.icon(
                label: Text(
                  'Send the code',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                icon: Icon(
                  Icons.telegram,
                  color: IconTheme.of(context).color,
                  size: IconTheme.of(context).size,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            const Text('The code has been sent sucessfully!'),
                        backgroundColor:
                            const Color.fromARGB(255, 211, 159, 47),
                        action: SnackBarAction(
                          label: 'Ok',
                          textColor: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            */
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: 300,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Text(
                  'We\'ve sent a confirmation code. Please check your email.',
                  style: Theme.of(context).textTheme.headline3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Go back',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // kod jest prawidlowy i validacja + [chociaz chyba to pierwsze wystarczy]
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    // screen:true czyli przenosi na logowanie
                                    const PwdResetFinal(screen: true)));
                      } else {
                        setState(() => _autoValidate = AutovalidateMode.always);
                      }
                    },
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
