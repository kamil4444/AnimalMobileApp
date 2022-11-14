import 'package:animal_app/main.dart';
import 'package:animal_app/view/Login%20and%20Register/PwdResetCode.dart';
import 'package:flutter/material.dart';
import 'package:animal_app/view/User/UserAccount.dart';

class PwdResetFinal extends StatefulWidget {
  final bool screen;
  const PwdResetFinal({Key? key, required this.screen}) : super(key: key);

  @override
  State<PwdResetFinal> createState() => _PwdResetFinal();
}

class _PwdResetFinal extends State<PwdResetFinal> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = "", _passwordConfirm = "";
  bool _passwordInVisible1 = true,
      _passwordInVisible2 = true; //a boolean value; //a boolean value

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      onChanged: (value) => _password = value,
                      obscureText: _passwordInVisible1,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: IconButton(
                          icon: Icon(_passwordInVisible1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordInVisible1 = !_passwordInVisible1;
                            });
                          },
                        ),
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: TextFormField(
                      onChanged: (value) => _passwordConfirm = value,
                      obscureText: _passwordInVisible2,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                        prefixIcon: IconButton(
                          icon: Icon(_passwordInVisible2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordInVisible2 = !_passwordInVisible2;
                            });
                          },
                        ),
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter confirm password';
                        }
                        if (value != _password) {
                          return 'Confirm password not matching';
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
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                border: Border.all(width: 5),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Text("Type your new password!",
                  style: Theme.of(context).textTheme.headline3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text("Password changed!"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    print(widget.screen);
                                    widget.screen
                                        ? Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StartPage()),
                                            (route) => false)
                                        : Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const UserAccount()),
                                            (route) => false);
                                  },
                                  child: Text(
                                    "OK",
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Confirm',
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
