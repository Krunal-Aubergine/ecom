import 'package:ecom/constants.dart';
import 'package:ecom/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            MaterialButton(
                color: Colors.blueGrey.shade900,
                colorBrightness: Brightness.dark,
                child: Text('Signin'),
                onPressed: () {
                  auth
                      .signInWithEmailAndPassword(
                          email: _email!, password: _password!)
                      .then((_) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                  isLoggedIn = true;
                }),
            MaterialButton(
              colorBrightness: Brightness.dark,
              color: Colors.blueGrey.shade900,
              child: Text('Signup'),
              onPressed: () {
                auth
                    .createUserWithEmailAndPassword(
                        email: _email!, password: _password!)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                });
                isLoggedIn = true;
              },
            )
          ])
        ],
      ),
    );
  }
}
