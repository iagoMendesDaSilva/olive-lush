import 'package:flutter/cupertino.dart';
import 'commons/Header.dart';

class CollectionScreen extends StatelessWidget {

  static const ingredient = "Vodka";

  @override
  Widget build(BuildContext context) {
    return Container(
        child:  Header( text: ingredient ),
    );
  }
}