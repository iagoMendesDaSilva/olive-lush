import 'package:flutter/material.dart';

import '../../../models/Alcoholic.dart';

class FooterInfo extends StatelessWidget {
  final Alcoholic alcoholic;

  const FooterInfo({super.key, required this.alcoholic});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Opacity(
          opacity: 0.5,
          child: Icon(
            alcoholic.icon,
            size: 20,
          ),
        ),
        Text(alcoholic.label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
