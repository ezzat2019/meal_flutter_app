import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';

class FullImageScreen extends StatelessWidget {
  final Meal meal;

  FullImageScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, c) {
      return SafeArea(
          child: Container(
        width: c.maxWidth,
        height: c.maxHeight,
        child: InteractiveViewer(
          child: Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.fill,
              )),
        ),
      ));
    });
  }
}
