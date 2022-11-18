import 'dart:ffi';

import 'package:flutter/material.dart';
import '../main.dart';

class Animal {
  String _name;
  String _description;
  DateTime _birth_date;
  String _sex;
  double _weight;
  String _image;
  int id;
  // Pin pins;
  // Breed breed;

  // Constructor

  Animal(this.id, this._name, this._description, this._birth_date, this._sex,
      this._weight, this._image);

  // Setters & Getters

  String get name => _name;
  set name(String name) {
    _name = name;
  }

  String get image => _image;
  set image(String image) {
    _image = image;
  }

  double get weight => _weight;
  set weight(double weight) {
    _weight = weight;
  }

  String get sex => _sex;
  set sex(String sex) {
    _sex = sex;
  }

  DateTime get birth_date => _birth_date;
  set birth_date(DateTime birthDate) {
    _birth_date = birthDate;
  }

  String get description => _description;
  set description(String description) {
    _description = description;
  }

  // Setters & Getters
}
