import 'package:flutter/material.dart';
import 'package:statistic_covid19/config/env.dart';
import 'package:statistic_covid19/view/detail/detail_page.dart';
import 'package:statistic_covid19/view/home/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Env.homeRoute: (BuildContext context){
      return HomePage();
    },
    Env.detailRoute: (BuildContext context){
      return DetailPage();
    }
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes,
      initialRoute: Env.homeRoute,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF101010),
        cardColor: Color(0xFF222222),
      ),
    );
  }
}