/*import 'package:flutter/material.dart';
import 'package:shop_app/screens/admin.dart';
import 'package:shop_app/screens/home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pet_shop_app/services/authentication.dart';
import 'package:pet_shop_app/page/root_page.dart';
import 'package:pet_shop_app/screens/admin.dart';
import 'package:pet_shop_app/screens/home.dart';



void main() {
  runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new Myapp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Pet Love',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
     return SplashScreen(
        seconds: 5,
        backgroundColor: Colors.purple[800], 
        //image: Image.asset('logo.jpg'),
        loaderColor: Colors.white, 
        photoSize: 150.0,
        navigateAfterSeconds: MyApp(),  
      );
   
  }
}
