import 'Animal.dart';

class User {
  String _name;
  String _surname;
  String _city;
  String _email;
  int _age;
  String _phoneNumber;
  String _photo;
  List<Animal> _animals;
  // Walk walks[];
  // Post posts[];
  bool _regulations;
  String _sex;
  // Post hiddenPosts[];
  // User friends[];

  User(this._age, this._city, this._email, this._name, this._phoneNumber,
      this._photo, this._regulations, this._sex, this._surname, this._animals);
}
