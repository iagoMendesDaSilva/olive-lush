import 'package:flutter/material.dart';
import 'package:olive_lush/models/Alcoholic.dart';
import 'package:olive_lush/screens/DrinkScreen/DrinkScreen.dart';

import 'FooterInfo.dart';
import 'HeaderInfo.dart';

class HandPickedDrink extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final Alcoholic alcoholic;
  final String img;

  const HandPickedDrink(
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
            MaterialPageRoute(builder: (context) => DrinkScreen(id:id)),
          );
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                          errorBuilder: (c, o, s) =>
                              Image.asset('assets/placeholder.jpg'),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeaderInfo(
                                      name: name, description: description),
                                  FooterInfo(alcoholic: alcoholic)
                                ])))
                  ]),
            )));
  }
}