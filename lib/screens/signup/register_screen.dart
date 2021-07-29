import 'package:ecom/constants.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:ionicons/ionicons.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var errormsg;
  bool? _success;
  String _userEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      shape: Border.all(
                          style: BorderStyle.solid,
                          width: 0.9,
                          color: Colors.amber),
                      icon: Ionicons.person_add_outline,
                      backgroundColor: Colors.blueGrey.shade900,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _register();
                          (_success == true)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                              : print('');
                        }
                      },
                      text: 'Register',
                    ),
                  ),
                  //snackbar error message
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      _success == null
                          ? errormsg.toString()
                          : (_success!
                              ? 'Successfully registered $_userEmail'
                              : errormsg),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      user!.sendEmailVerification();

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email!;
        });
      } else {
        _success = false;
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errormsg = e.message;
      });
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
