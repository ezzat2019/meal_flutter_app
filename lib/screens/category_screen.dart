import 'package:flutter/material.dart';
import 'package:meal_flutter_app/dummy_data.dart';
import 'package:meal_flutter_app/widgets/category_Item.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Meal Category"),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
          children: [
            ...DUMMY_CATEGORIES.map((e) =>
            CategoryItem(e.id, e.title, e.color)
            )
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 20,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            maxCrossAxisExtent: 200
          )),
    );
  }
}
