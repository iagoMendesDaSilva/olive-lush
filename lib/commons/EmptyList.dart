import 'package:flutter/material.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Text(StringResource.strings['empty_list']!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall)
    );
  }
}