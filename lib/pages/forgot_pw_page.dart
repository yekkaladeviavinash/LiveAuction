import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final  _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
          showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:Text('Paswword reset link sent! Check your email'),
            );
          },
          );
    } on FirebaseAuthException catch (e) {
      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content:Text(e.message.toString()),
      //       );
      //     },
      //     );
      final snackBar = SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: Colors.red[900],
            action: SnackBarAction(
              label: '',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
  }

  Widget build(BuildContext context) {
    // Set status bar color to white
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Color.fromARGB(255, 255, 255, 255), // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Ensure status bar icons are visible
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 255),
      extendBodyBehindAppBar: true, // Allow contents to enter status bar area
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0), // Add padding to top
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter Your Email and we will send you a password and reset link',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _emailController,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: passwordReset,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 22.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}