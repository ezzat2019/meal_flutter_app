import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_flutter_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  List<String> imgList = List();

  WelcomeScreen() {
    imgList.add("assets/images/image_slider.jpg");
    imgList.add("assets/images/w1.jpg");
    imgList.add("assets/images/w2.jpg");
    imgList.add("assets/images/w3.jpg");
    imgList.add("assets/images/w4.jpg");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (_, c) => Scaffold(
        body: Stack(children: <Widget>[
          CarouselSlider.builder(
            itemCount: imgList.length,
            itemBuilder: (ctx, index) {
              return Container(
                width: c.maxWidth,
                height: c.maxHeight,
                child: Image.asset(
                  imgList[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: c.maxHeight,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              initialPage: 0,
            ),
          ),
          Align(
            alignment: Alignment(0, .50),
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.black45,
              child: Text(
                "Welcome to Meal App \nby Ezzat",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "sans-serif-condensed"),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, .75),
            child: Container(
              padding: EdgeInsets.all(8),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 7,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 100),
                color: Colors.pink,
                onPressed: () {
                  SharedPreferences.getInstance().then((value) {
                    value.setBool("is_welcome", true);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return MyApp();
                    }));
                  });
                },
                child: Text(
                  "Get Start Now",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
