import 'dart:async';
import 'dart:math';
import 'package:clinica/pages/habitosview.dart';
import 'package:clinica/pages/login.dart';
import 'package:clinica/pages/menu.dart';
import 'package:flutter/material.dart';

import '../main.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediClaim',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightBlueAccent, child: LogoApp());
  }
}

Widget LogoApp() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final radius = min(constraints.maxHeight / 5, constraints.maxWidth / 5);
      return Center(
        child: CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
            "https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/206607291_426492431652148_3815552429703026363_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=j6067QrDqc8AX8VitGe&tn=teuR1qKioX3N703a&_nc_ht=scontent.fbaq8-1.fna&oh=aa3d3a6dae7679e865935a935fd90286&oe=61458E11",
          ),
        ),
      );
    },
  );
}
