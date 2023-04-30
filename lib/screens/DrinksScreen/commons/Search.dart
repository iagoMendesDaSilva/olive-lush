import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:olive_lush/utils/strings.dart' as StringResource;

class Search extends StatefulWidget {
  final ValueChanged<String> onSearchTextChanged;

  Search({super.key, required this.onSearchTextChanged});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<Search> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchTextController.removeListener(_onSearchTextChanged);
    _searchTextController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    widget.onSearchTextChanged(_searchTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
            color: Theme.of(context).colorScheme.background,
            width: double.infinity,
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Opacity(opacity: .5, child: Icon(Icons.search, size: 20)),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.bodySmall,
                    controller: _searchTextController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      hintText: StringResource.strings['search_drink'],
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            )));
  }
}
