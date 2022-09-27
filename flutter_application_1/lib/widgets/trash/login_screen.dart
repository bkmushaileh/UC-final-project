import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordCredential = TextEditingController();
  final errorMessage = "";
  // Future signIn() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordCredential.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordCredential.dispose();
    super.dispose();
  }

  Future signin() async {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordCredential.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 104, 54),
        title: Text(
          "Login page",
          style: TextStyle(
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 255, 173, 59),
                ),
                label: Text(
                  "Enter your email here",
                  style: TextStyle(
                    color: Color.fromARGB(255, 19, 99, 185),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              obscureText: true,
              controller: passwordCredential,
              cursorColor: Color.fromARGB(255, 255, 255, 255),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 255, 173, 59),
                ),
                label: Text(
                  "Enter your password here",
                  style: TextStyle(
                    color: Color.fromARGB(255, 19, 99, 185),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 300,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                  color: Color.fromARGB(255, 19, 99, 185),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                label: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color.fromARGB(255, 19, 99, 185),
                  ),
                ),
                onPressed: (signin),
              ),
            )
          ],
        ),
      ),
    );
  }
}
