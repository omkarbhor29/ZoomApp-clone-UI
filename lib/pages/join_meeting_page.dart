import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/root_app.dart';
import 'package:zoom_clone/themes/colors.dart';

class JoinMeetingPage extends StatefulWidget {
  @override
  _JoinMeetingPageState createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  bool isAudioSwitch = true;
  bool isVideoSwitch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerAndFooter,
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: headerAndFooter,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Close",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Center(child: Text("Join a Meeting")),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            children: [
              Container(
                width: size.width * 0.3,
                height: 40,
              ),
              Container(
                width: size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3, left: 15),
                  child: TextField(
                    cursorColor: primary,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Meeting ID",
                        hintStyle: TextStyle(
                          color: grey.withOpacity(0.3),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: grey,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Join with a personal link name",
          style: TextStyle(color: primary),
        ),
        SizedBox(height: 15),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            children: [
              Container(
                width: size.width * 0.3,
              ),
              Container(
                width: size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3, left: 15),
                  child: TextField(
                    cursorColor: primary,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Screen Name",
                      hintStyle: TextStyle(
                        color: grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => RootApp()), (route) => false);
          },
          child: Container(
            width: size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              "Join",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "If you recieved an invitation link, tab on the link again to join the meeting",
            style: TextStyle(color: grey.withOpacity(0.6), height: 1.3),
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Don't Connect To Audio",
                  style: TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                    activeColor: primary,
                    value: isAudioSwitch,
                    onChanged: (value) {
                      setState(() {
                        isAudioSwitch = value;
                      });
                    }),
              ],
            ),
          ),
        ),
        Container(
          width: size.width,
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Turn Off My video",
                  style: TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                    activeColor: primary,
                    value: isVideoSwitch,
                    onChanged: (value) {
                      setState(() {
                        isVideoSwitch = value;
                      });
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
