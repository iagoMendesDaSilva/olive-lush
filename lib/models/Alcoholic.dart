import 'package:flutter/cupertino.dart';

enum AlcoholicType {
  Alcoholic,
  NonAlcoholic,
  OptionalAlcoholic
}

class Alcoholic {
  late String label;
  late IconData icon;

  Alcoholic(String label, IconData icon){
    this.label = label;
    this.icon = icon;
  }

  static convertAlcoholicType(type){
    switch (type.toLowerCase()) {
      case 'alcoholic':
        return AlcoholicType.Alcoholic;
      case 'non alcoholic':
        return AlcoholicType.NonAlcoholic;
      default:
        return AlcoholicType.OptionalAlcoholic;
    }
  }
}