import 'package:animal_app/view/Login%20and%20Register/PwdResetFinal.dart';
import 'package:animal_app/view/User/UserDeleteAccount.dart';
import 'package:animal_app/view/User/UserEditableProfile.dart';
import 'package:animal_app/widget/ScaffoldClass.dart';
import 'package:animal_app/view/User/UserPets.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccount();
}

class _UserAccount extends State<UserAccount> {
  // TODO : fetch from DB
  String _userName = 'username';

  @override
  Widget build(BuildContext context) {
    return ScaffoldClass(
      appBarIcon: true,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Dog_training.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Center(
            child: Text(
              _userName,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyPets())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Color.fromARGB(174, 141, 90, 1)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'My pets',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Dog.png'), fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserEditableProfile())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Color.fromARGB(174, 141, 90, 1)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'My profile',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Happy.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: GestureDetector(
            onTap: () => print('To Dog profile'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Color.fromARGB(174, 141, 90, 1)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Friends',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Friends.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    // screen:false czyli przenosi na /account
                    builder: (context) => const PwdResetFinal(screen: false))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Color.fromARGB(174, 141, 90, 1)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Password change',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Eye.png'), fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserDeleteAccount())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 50,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Color.fromARGB(174, 141, 90, 1)))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Usun konto',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.delete_rounded,
                    size: 50,
                    color: Theme.of(context).textTheme.headline4!.color,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
