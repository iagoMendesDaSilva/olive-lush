import 'package:flutter/material.dart';
import 'package:olive_lush/models/Alcoholic.dart';

import '../screens/DrinkScreen/DrinkScreen.dart';

class DrinkItem extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final Alcoholic alcoholic;
  final String img;

  const DrinkItem(
      {super.key,
      required this.id,
      required this.name,
      required this.description,
      required this.alcoholic,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrinkScreen(id: id,)),
          );
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
                height: 105.0,
                color: Theme.of(context).colorScheme.background,
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      img,
                      width: 105,
                      height: double.infinity,
                      errorBuilder: (c, o, s) =>
                          Image.asset('assets/placeholder.jpg'),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Container(
                          width: 105,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            height: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeaderInfo(
                                      name: name, description: description),
                                  FooterInfo(alcoholic: alcoholic),
                                ]),
                          )))
                ]))));
  }
}

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
            padding: EdgeInsets.only(bottom: 3),
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium)),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

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
