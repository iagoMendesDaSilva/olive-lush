import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final int index;
  final String ingredient;
  final String measure;

  const IngredientItem(
      {super.key,
        required this.index,
        required this.ingredient,
        required this.measure});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            index.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
      SizedBox(width: 10),
      Text(
        ingredient,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      SizedBox(width: 8),
      Text(
        measure,
        style: Theme.of(context).textTheme.bodySmall,
      )
    ]);
  }
}