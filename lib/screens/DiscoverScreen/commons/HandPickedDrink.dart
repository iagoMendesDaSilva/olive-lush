import 'package:flutter/material.dart';
import 'package:olive_lush/models/GlassType.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;

class HandPickedDrink extends StatelessWidget {
  final String name;
  final String description;
  final GlassType glassType;
  final String img;

  const HandPickedDrink(
      {super.key,
      required this.name,
      required this.description,
      required this.glassType,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
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
                      errorBuilder: (c, o, s) =>
                          Image.asset('assets/placeholder.jpg'),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                            color: AppColors.grayLight,
                            child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ));
                      },
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
                              FooterInfo(glassType: glassType)
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
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

class FooterInfo extends StatelessWidget {
  final GlassType glassType;

  const FooterInfo({super.key, required this.glassType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          glassType.icon,
          color: AppColors.gray,
          size: 20,
        ),
        Text(glassType.label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
