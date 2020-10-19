import 'package:flutter/material.dart';
import 'package:flutter_car/screen/filter_search.dart';
import 'package:flutter_car/screen/home_car.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //iconTheme: IconThemeData(color: Colors.black),
          primaryIconTheme: IconThemeData(color: Colors.black)
          // textTheme: GoogleFonts.muliTextTheme(),
          ),
      debugShowCheckedModeBanner: false,
      home: HomeCar(),
    );
  }
}
