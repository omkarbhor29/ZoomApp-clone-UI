import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/root_app.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    debugShowCheckedModeBanner: false,
    home: RootApp(),
  ));
}
