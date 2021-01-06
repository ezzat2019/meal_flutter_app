import 'package:flutter/material.dart';
import 'package:meal_flutter_app/screens/category_screen.dart';
import 'package:meal_flutter_app/screens/favourite_screen.dart';
import 'package:meal_flutter_app/widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int c_index = 0;

  @override
  Widget build(BuildContext context) {

    Widget page=CategoryScreen();
    if(c_index==0)
      {
        page=CategoryScreen();
      }
    else if(c_index==1)
      {
        page=FavouriteScreen();
      }

    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            c_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite")
        ],
        currentIndex: c_index,
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
