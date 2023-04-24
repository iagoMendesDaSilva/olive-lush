import 'package:flutter/cupertino.dart';
import 'commons/Header.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CollectionScreenState();
}

class CollectionScreenState extends State<CollectionScreen> {

  static const ingredient = "Vodka";

  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Header( text: ingredient ),
    );
  }
}