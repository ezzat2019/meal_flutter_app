import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:meal_flutter_app/screens/meal_details.dart';
import 'package:meal_flutter_app/widgets/meal_Item.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  Function pp;
  List<Meal> favList;

  FavouriteScreen(this.pp, this.favList);

  @override
  State<StatefulWidget> createState() {
    return _FavouriteScreenState();
  }
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Meal> mealsOfOneCategoty;

  @override
  void initState() {
    mealsOfOneCategoty = widget.favList;
  }

  Function removeItem(value) {
    setState(() {
      mealsOfOneCategoty.removeWhere((element) => element.id == value);
    });
  }

  Function gotoDetails(BuildContext c, Meal meal) {
    setState(() {
      Navigator.of(c).push(MaterialPageRoute(builder: (_) {
        return MealDetails(meal, widget.pp, widget.favList);
      })).then((value) {
        if (value != null) {
          removeItem(value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(!myProvider.switch_lan
              ? myProvider.mapEn["f_title"]
              : myProvider.mapAr["f_title"]),
        ),
        body: ListView.builder(
          itemBuilder: (context, pos) {
            return MealItem(widget.favList[pos], gotoDetails);
          },
          itemCount: mealsOfOneCategoty.length,
        ));
  }
}
