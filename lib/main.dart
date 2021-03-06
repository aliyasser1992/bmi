
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white,),
        textTheme: const TextTheme(
         headline1: TextStyle(
             fontSize: 45,fontWeight: FontWeight.w400,color: Colors.white
         ),
          headline2: TextStyle(
              fontSize: 30,fontWeight: FontWeight.w900,color: Colors.black
          ),
          bodyText1: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}
