import 'package:animal_app/main.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
/*

headline1 => app name
headline2 => eq login, register, title of the page
headline3 => regular black text
headline4 => Text on button
headline5 => text near text-links
headline6 => text-links

subtitle1 => inside of text
x
*/

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool _passwordInVisible = true;
  bool? valueRegulations = false; //a boolean value
  bool? valuePersonalData = false; //a boolean value
  String _chbValidationRegulations = "";
  String _chbValidationPersonalData = "";
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Logowanie.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
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
              Text(
                'Register',
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Email'),
                    style: Theme.of(context).textTheme.subtitle1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email address';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Not a vaild email address.';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Login'),
                    style: Theme.of(context).textTheme.subtitle1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter login';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  obscureText: _passwordInVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(_passwordInVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Theme.of(context).iconTheme.color,
                      iconSize: Theme.of(context).iconTheme.size,
                      onPressed: () {
                        setState(() {
                          _passwordInVisible = !_passwordInVisible;
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartPage()));
                },
                child: Text(
                  'Already have an account? Log in!',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartPage())),
                  child: Text(
                    'I accept the terms and conditions.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Column(children: [
                  Checkbox(
                    value: valueRegulations,
                    onChanged: (bool? value) {
                      setState(() {
                        valueRegulations = value;
                        if (valueRegulations! == false) {
                          _chbValidationRegulations = "Required!";
                        } else {
                          _chbValidationRegulations = "";
                        }
                      });
                    },
                  ),
                  Text(_chbValidationRegulations,
                      style: TextStyle(color: Theme.of(context).errorColor)),
                ]),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartPage())),
                  child: Text('I agree to the processing of personal data.',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Column(
                  children: [
                    Checkbox(
                      value: valuePersonalData,
                      onChanged: (bool? value) {
                        setState(() {
                          valuePersonalData = value;
                          if (valuePersonalData! == false) {
                            _chbValidationPersonalData = "Required!";
                          } else {
                            _chbValidationPersonalData = "";
                          }
                        });
                      },
                    ),
                    Text(_chbValidationPersonalData,
                        style: TextStyle(color: Theme.of(context).errorColor)),
                  ],
                )
              ]),
              Container(
                height: 70,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        valuePersonalData! &&
                        valueRegulations!) {
                      // api call db save itp
                      print("This worked. User is registered.");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()));
                    } else {
                      setState(() => _autoValidate = AutovalidateMode.always);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
