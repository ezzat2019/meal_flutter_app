import 'package:flutter/material.dart';
import 'package:meal_flutter_app/dummy_data.dart';
import 'package:meal_flutter_app/modules/category.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:meal_flutter_app/widgets/category_Item.dart';
import 'package:meal_flutter_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  Function pp;
  List<Meal> favList;

  CategoryScreen(this.pp, this.favList);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> available_category = DUMMY_CATEGORIES;
  List<Category> available_category2 = List();
  Map<String, bool> filterMap = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };

  List<Meal> meals = DUMMY_MEALS;

  void setFilter(Map<String, bool> filterMap) {
    setState(() {
      print("gggggggggggggggggggggggggggggggggg1");
      this.filterMap = filterMap;
      meals = DUMMY_MEALS.where((element) {
        if (filterMap["isVegetarian"] && !element.isVegetarian) {
          return false;
        } else if (filterMap["isLactoseFree"] && !element.isLactoseFree) {
          return false;
        } else if (filterMap["isVegan"] && !element.isVegan) {
          return false;
        } else if (filterMap["isGlutenFree"] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();

      available_category2 = [];
      available_category.forEach((element1) {
        String cat_id = element1.id;
        meals.forEach((element2) {
          element2.categories.forEach((element3) {
            if (element3 == cat_id) {
              if (!available_category2
                  .any((element4) => element4.id == cat_id)) {
                available_category2.add(element1);
                print("ggggggggggggg2");
              }
            }
          });
        });
        print("ggggggggggggg1");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ThemeProvider>(context);
    return Directionality(
      textDirection:
          myProvider.switch_lan ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(!myProvider.switch_lan
              ? myProvider.mapEn["c_app_bar"]
              : myProvider.mapAr["c_app_bar"]),
        ),
        body: GridView(
            padding: EdgeInsets.all(16),
            children: [
              ...(available_category2.isEmpty
                      ? available_category
                      : available_category2)
                  .map((e) => CategoryItem(
                      e.id, e.title, e.color, meals, widget.pp, widget.favList))
            ],
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 200)),
        drawer: MainDrawer(setFilter, widget.pp, widget.favList),
      ),
    );
  }
}
