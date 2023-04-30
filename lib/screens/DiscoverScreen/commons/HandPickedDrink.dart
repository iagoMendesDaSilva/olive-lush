import 'package:flutter/material.dart';
import 'package:olive_lush/models/Alcoholic.dart';

class HandPickedDrink extends StatelessWidget {
  final String name;
  final String description;
  final Alcoholic alcoholic;
  final String img;

  const HandPickedDrink(
      {super.key,
      required this.name,
      required this.description,
      required this.alcoholic,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                      errorBuilder: (c, o, s) => Image.asset('assets/placeholder.jpg'),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HeaderInfo(name: name, description: description),
                              FooterInfo(alcoholic: alcoholic)
                            ])))
              ]),
        ));
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
            padding: EdgeInsets.only(bottom: 5),
            child: Text(name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall)),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
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
