import 'package:flutter/material.dart';
import 'package:gdsclogintask/items.dart';
import 'package:gdsclogintask/login_screen.dart';
import 'package:gdsclogintask/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: Items(),
      debugShowCheckedModeBanner: false,
    );
  }
}



