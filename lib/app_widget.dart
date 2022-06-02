import 'package:flutter/material.dart';
import 'package:week7/views/home_page.dart';

//Shared preferences
//DIO
//MOBX
//Firebase
//SVG
//SplashScreen
//TabBar

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
