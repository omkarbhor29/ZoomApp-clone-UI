import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zoom_clone/json/participants.dart';
import 'package:zoom_clone/themes/colors.dart';

class ParticipantPage extends StatefulWidget {
  @override
  _ParticipantPageState createState() => _ParticipantPageState();
}

class _ParticipantPageState extends State<ParticipantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: headerAndFooter,
      appBar: getAppBar(),
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    var ParticipantsCount = participants.length;

    return AppBar(
      elevation: 0,
      backgroundColor: headerAndFooter,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "close",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      title: Center(child: Text("Participants ($ParticipantsCount)")),
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: black),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: headerAndFooter),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Invite",
                  style: TextStyle(
                      color: grey, fontWeight: FontWeight.w600, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 70),
          child: Column(
              children: List.generate(participants.length, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        participants[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 15),
                          Text(
                            participants[index]['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            MaterialCommunityIcons.microphone,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            index == 0
                                ? MaterialCommunityIcons.video
                                : MaterialIcons.videocam_off,
                            color: index == 0 ? grey : red,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: grey.withOpacity(0.08),
                )
              ],
            );
          }))),
    );
  }
}
