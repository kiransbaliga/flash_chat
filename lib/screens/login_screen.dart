import 'package:flash_chat/components/Textfield.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                              child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Txtfield(
                onchanged: (value) {
                  email = value;
                },
                hinttext: "Enter your Email",
                b: false,
              ),
              SizedBox(
                height: 8.0,
              ),
              Txtfield(
                onchanged: (value) {
                  password = value;
                },
                hinttext: "Enter your Password",
                b: true,
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedButton(
                onPressed: () async {
                  //Implement login functionality.
                  try {
                    setState(() {
                      showspinner = true;
                    });
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null)
                      Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      showspinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                colour: Colors.lightBlueAccent,
                title: "Log In",
              )
            ],
          ),
        ),
      ),
    );
  }
}
