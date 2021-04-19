import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/homepage.dart';
import 'package:flutter_provider/pages/page_create/page2.dart';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
    Page2.id :(context)=> Page2(),
    HomePage.id :(context) => HomePage(),
    },
  ));
}
