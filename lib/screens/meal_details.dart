import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/screens/full_image_screen.dart';

class MealDetails extends StatefulWidget {
  final Meal meal;
  Function pp;
  bool is_fav = false;

  List<Meal> favList;

  MealDetails(this.meal, this.pp, this.favList) {
    if (favList.contains(meal)) {
      is_fav = true;
    } else {
      is_fav = false;
    }
  }

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              stretch: false,
              snap: true,
              floating: true,
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.meal.title),
                background: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return FullImageScreen(widget.meal);
                      },
                    ));
                  },
                  child: Container(
                    child: Hero(
                      tag: widget.meal.id,
                      child: Image.network(
                        widget.meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      "ingredients",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "RobotoCondensed",
                          fontSize: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return Card(
                            color: Theme.of(context).accentColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(widget.meal.ingredients[index]),
                            ),
                          );
                        },
                        itemCount: widget.meal.ingredients.length,
                      ),
                    ),
                    Text(
                      "Steps",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "RobotoCondensed",
                          fontSize: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text("#${index + 1}"),
                                ),
                                title: Text(widget.meal.steps[index]),
                              ),
                              Divider()
                            ],
                          );
                        },
                        itemCount: widget.meal.steps.length,
                      ),
                    )
                  ],
                ),
              ),
            ]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (!widget.is_fav) {
              setState(() {
                widget.is_fav = true;
                widget.pp(widget.meal);
              });
            } else {
              setState(() {
                widget.favList.remove(widget.meal);

                widget.is_fav = false;
              });
            }
          },
          child: widget.is_fav
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
