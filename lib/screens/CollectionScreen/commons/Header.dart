import 'package:flutter/material.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

class Header extends StatelessWidget {
  final String text;

  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: RichText(
          text: TextSpan(
            text: StringResource.strings['header_collection_p1'],
            style: Theme.of(context).textTheme.titleLarge,
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor),
              ),
              TextSpan(
                text: StringResource.strings['header_collection_p2'],
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ));
  }
}