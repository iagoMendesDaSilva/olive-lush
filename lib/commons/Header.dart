import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String? text;

  const Header( {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: new EdgeInsets.only(top:25.0, bottom: 20.0),
      child:  Text(text! , style: Theme.of(context).textTheme.titleLarge),
    );
  }
}