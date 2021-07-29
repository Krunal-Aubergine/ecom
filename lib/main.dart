import 'package:ecom/constants.dart';
import 'package:ecom/screens/categories_screen.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/screens/signin/signin_screen.dart';
import 'package:ecom/screens/signup/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.grey[200],
        primaryColor: Color(0xFF263238),
        accentColor: kAccentColor,
        primaryColorDark: Color(0xFF000a12),
        primaryColorLight: Color(0XFF4f5b62),
      ),
      // home: CategoriesScreen(),
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
    );
  }
}
