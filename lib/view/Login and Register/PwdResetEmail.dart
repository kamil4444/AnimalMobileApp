import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'PwdResetCode.dart';

class PwdResetEmail extends StatefulWidget {
  const PwdResetEmail({Key? key}) : super(key: key);

  @override
  State<PwdResetEmail> createState() => _PwdResetEmail();
}

class _PwdResetEmail extends State<PwdResetEmail> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  // gdzieś tu będzie funkcja await, która będzie czekała na kod wygenerowany przez server.
  // zakladamy np. że kod ma 5 cyfr. na razie final
  final String _generatedCode = '11111';

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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your email...',
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        suffixIcon: Icon(
                          Icons.email_rounded,
                          color: IconTheme.of(context).color,
                          size: IconTheme.of(context).size,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email.';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Not a vaild email address.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                  'Please, let us verify who you are! Fill the email box and click "Next".',
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
                        // Wysylamy kod i przekazujemy go do kolejnej aktywnosic
                        // tu ta funkcja z początku async

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PwdResetCode(
                                      code: _generatedCode,
                                    )));
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
            )
          ],
        ),
      ),
    );
  }
}
