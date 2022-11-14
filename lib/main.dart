import 'package:animal_app/view/Login%20and%20Register/Register.dart';
import 'package:animal_app/view/User/Start.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode
import 'view/Login and Register/PwdResetEmail.dart';
/*

headline1 => app name
headline2 => eq login, register, title of the page
headline3 => regular black text
headline4 => Text on button
headline5 => text near text-links
headline6 => text-links

subtitle1 => inside of textbox
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Start(),
      theme: theme,
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  State<StartPage> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordInVisible = true; //a boolean value
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

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
                'Login',
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: TextFormField(
                    decoration: const InputDecoration(hintText: 'User name'),
                    style: Theme.of(context).textTheme.subtitle1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter user name';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextFormField(
                  obscureText: _passwordInVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: IconButton(
                      icon: Icon(_passwordInVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                          builder: (context) => const PwdResetEmail()));
                },
                child: Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                height: 70,
                width: 120,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Start()),
                          (route) => false);
                    } else {
                      setState(() => _autoValidate = AutovalidateMode.always);
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You do not have an account?',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  TextButton(
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
