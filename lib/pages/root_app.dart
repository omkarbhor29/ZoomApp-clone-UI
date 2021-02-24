import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zoom_clone/json/root_app.dart';
import 'package:zoom_clone/json/root_app.dart';
import 'package:zoom_clone/pages/home_page.dart';
import 'package:zoom_clone/pages/participants_page.dart';
import 'package:zoom_clone/themes/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: headerAndFooter,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                (Octicons.mute),
                color: grey,
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                (AntDesign.camera),
                color: grey,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.security_outlined,
                color: green,
                size: 15,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                "Zoom",
                style: TextStyle(
                    fontSize: 17, color: grey, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: grey,
                size: 20,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage()),
                  (route) => false);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: red, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 5, bottom: 5),
                child: Text(
                  "Leave",
                  style: TextStyle(
                      fontSize: 15, color: grey, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getFooter() {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: headerAndFooter,
        border:
            Border(top: BorderSide(width: 2, color: black.withOpacity(0.06))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(bottomItems[index],
                        color: colorItems[index], size: sizedItems[index]),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 10,
                          color: grey,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: black),
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 170,
          )
        ],
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
    if (pageIndex == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true, builder: (_) => ParticipantPage()));
    } else if (pageIndex == 4) {
      getBottomSheet();
    }
  }

  getBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: List.generate(actionSheetItems.length, (index) {
              if (actionSheetItems[index] == "Disconnect Audio") {
                return CupertinoActionSheetAction(
                    child: Text(
                      actionSheetItems[index],
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    });
              }

              return CupertinoActionSheetAction(
                  child: Text(actionSheetItems[index]),
                  onPressed: () {
                    Navigator.pop(context);
                  });
            })));
  }
}
