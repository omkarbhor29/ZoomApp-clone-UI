import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/themes/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerAndFooter,
      appBar: getAppBar(),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: headerAndFooter,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.settings,
              color: grey,
            ),
            Spacer(),
            Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color:
                            activeTab == index ? grey : grey.withOpacity(0.2),
                        shape: BoxShape.circle),
                  ),
                );
              }),
            ),
            Spacer(),
          ],
        ));
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 200,
      decoration: BoxDecoration(color: headerAndFooter),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width * 0.75,
              height: 50,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Text(
                  "Join a Meeting",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sign Up",
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 17)),
                Text("Sign In",
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var options = CarouselOptions(viewportFraction: 0.99, height: size.height);
    List<Color> colors = [
      red,
      primary,
      green,
      black,
    ];

    return CarouselSlider(
        items: List.generate(4, (index) {
          return Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(color: colors[index]),
          );
        }),
        options: options);
  }
}
