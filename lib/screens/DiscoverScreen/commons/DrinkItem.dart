import 'package:flutter/material.dart';
import 'package:olive_lush/models/GlassType.dart';
import 'package:olive_lush/colors.dart' as AppColors;

class DrinkItem extends StatelessWidget {
  final String name;
  final String description;
  final GlassType glassType;
  final List<String> ingredients;
  final String img;

  const DrinkItem(
      {super.key,
      required this.name,
      required this.description,
      required this.glassType,
      required this.ingredients,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
            height: 105.0,
            color: Colors.white,
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  img,
                  height: double.infinity,
                  width: 105.0,
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        height: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                                  Text(
                                    description,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    glassType.icon,
                                    color: AppColors.gray,
                                    size: 20,
                                  ),
                                  Text(glassType.label,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall),
                                ],
                              ),
                            ]),
                      )))
            ])));
  }
}
