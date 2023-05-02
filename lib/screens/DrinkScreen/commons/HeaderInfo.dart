import 'package:flutter/material.dart';

class HeaderInfo extends StatelessWidget {
  final String name;
  final String description;

  const HeaderInfo({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium)),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}