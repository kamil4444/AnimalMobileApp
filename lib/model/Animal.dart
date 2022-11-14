import 'dart:ffi';

import 'package:flutter/material.dart';
import '../main.dart';

class Animal {
  String _name;
  String _description;
  DateTime _birth_date;
  bool _sex;
  Double _weight;
  Double _height;
  String _image;
  // Pin pins;
  // Breed breed;

  // Constructor

  Animal(this._name, this._description, this._birth_date, this._sex,
      this._weight, this._height, this._image);

  // Setters & Getters

  String get name => _name;
  set name(String name) {
    _name = name;
  }

  String get image => _image;
  set image(String image) {
    _image = image;
  }

  Double get height => _height;
  set height(Double height) {
    _height = height;
  }

  Double get weight => _weight;
  set weight(Double weight) {
    _weight = weight;
  }

  bool get sex => _sex;
  set sex(bool sex) {
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
