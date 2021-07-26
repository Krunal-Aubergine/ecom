import 'package:ecom/colors.dart';
import 'package:ecom/screens/categories_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.grey[200],
        primaryColor: Color(0xFF263238),
        accentColor: kAccentColor,
        primaryColorDark: Color(0xFF000a12),
        primaryColorLight: Color(0XFF4f5b62),
      ),
      home: CategoriesScreen(),
    );
  }
}
