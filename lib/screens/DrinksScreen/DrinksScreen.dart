import 'package:flutter/cupertino.dart';
import 'package:olive_lush/commons/commons.dart';
import 'package:olive_lush/strings.dart' as StringResource;

class DrinksScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DrinksScreenState();
}

class DrinksScreenState extends State<DrinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Header( text: StringResource.strings['header_drinks']),
    );
  }
}