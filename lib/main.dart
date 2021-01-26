import 'package:flutter/material.dart';
import 'package:meal_flutter_app/modules/meal.dart';
import 'package:meal_flutter_app/providers/theme_provider.dart';
import 'package:meal_flutter_app/screens/category_screen.dart';
import 'package:meal_flutter_app/screens/favourite_screen.dart';
import 'package:meal_flutter_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = WelcomeScreen();

  _MyAppState() {
    getPage().then((value) {
      setState(() {
        currentPage = value;
      });
    });
  }

  Future<Widget> getPage() async {
    final sh = await SharedPreferences.getInstance();
    bool isStarted = sh.getBool("is_welcome") ?? false;
    // sh.remove("is_welcome");
    if (isStarted) {
      return MyHomePage();
    } else {
      return WelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Provider.of<ThemeProvider>(context).currentColorPrimary,
        accentColor: Provider.of<ThemeProvider>(context).currentColorAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        buttonColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        buttonColor: Colors.white,
        primaryColor: Provider.of<ThemeProvider>(context).currentColorPrimary,
        accentColor: Provider.of<ThemeProvider>(context).currentColorAccent,
        canvasColor: Color.fromRGBO(0, 0, 0, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(),
      home: currentPage,
    );
  }

  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).getModePref();
    Provider.of<ThemeProvider>(context, listen: false).getPrefColor();
    Provider.of<ThemeProvider>(context, listen: false).getFavLan();
    super.initState();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int c_index = 0;
  List<Meal> favList = [];

  void pp(Meal meal) {
    setState(() {
      if (!favList.contains(meal)) {
        favList.add(meal);
        print(meal.title + "   " + favList.length.toString());
      } else {
        favList.remove(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page = CategoryScreen(pp, favList);
    if (c_index == 0) {
      page = CategoryScreen(pp, favList);
    } else if (c_index == 1) {
      page = FavouriteScreen(pp, favList);
    }
    final myProvider = Provider.of<ThemeProvider>(context);
    return Directionality(
      textDirection:
          myProvider.switch_lan ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
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
                icon: Icon(Icons.category_rounded),
                label: !myProvider.switch_lan
                    ? myProvider.mapEn["c_cat"]
                    : myProvider.mapAr["c_cat"]),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: !myProvider.switch_lan
                    ? myProvider.mapEn["c_fav"]
                    : myProvider.mapAr["c_fav"])
          ],
          currentIndex: c_index,
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
