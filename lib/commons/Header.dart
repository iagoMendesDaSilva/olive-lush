import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String? text;

  const Header( {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.fromLTRB(0, 25, 0, 0),
      child:  Text(text! , style: Theme.of(context).textTheme.titleLarge),
    );
  }
}