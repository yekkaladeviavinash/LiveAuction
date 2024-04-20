// import 'dart:ffi';
// import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:liveauction/models/usermodel.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showloginpage;
  const RegisterPage({Key? key, required this.showloginpage}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  bool _obscureText = true;

  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  // final snackBar = SnackBar(
  //   content: const Text('You are registered successfully!'),
  //   backgroundColor: Colors.greenAccent,
  //   action: SnackBarAction(
  //     label: '',
  //     onPressed: () {
  //       // Some code to undo the change.
  //     },
  //   ),
  // );

  // final passwordnotmatching = SnackBar(
  //   content: Text("Both passwords are not matching !!!"),
  //   backgroundColor: Colors.red[900],
  //   action: SnackBarAction(
  //     label: '',
  //     onPressed: () {
  //       // Some code to undo the change.
  //     },
  //   ),
  // );
  Future signup() async {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      //Authentication using email and password
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());

      //Adding user details
      // adduser(_usernameController.text.trim(), _contactController.text.trim(), _emailController.text.trim());

      //commented this
      // await FirebaseFirestore.instance.collection('users').add({
      //   'username':_usernameController.text.trim(),
      //   'phone':_contactController.text.trim(),
      //   'email':_emailController.text.trim(),
      //   'auctionhistory':[],
      //   'sellerhistory':[],
      // });

      usermodel myuser = usermodel(
          username: _usernameController.text.trim(),
          uid: cred.user!.uid,
          phone: _contactController.text.trim(),
          email: _emailController.text.trim(),
          auctionhistory: [],
          sellerhistory: [],
          profileimagelink: '',
          wishlist: [],
          );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(cred.user!.uid)
          .set(myuser.toJson());
      Get.snackbar(
        'Success',
        'You are successfully registered',
        colorText: Colors.white,
        backgroundColor: Colors.black87,
      );
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(passwordnotmatching);
    }
  }

  // Future adduser(String username, String phone, String email)async{
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'username':username,
  //     'phone':phone,
  //     'email':email
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0 * H,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      cursorColor: Color.fromARGB(255, 216, 97, 29),
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0 * H),
                    TextFormField(
                      controller: _emailController,
                      cursorColor: Color.fromARGB(255, 216, 97, 29),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0 * H),
                    TextFormField(
                      controller: _contactController,
                      cursorColor: Color.fromARGB(255, 216, 97, 29),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Contact no.',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29))),
                      ),
                      validator: (value) {
                        if (value!.length != 10) {
                          return 'Please enter your contact no.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0 * H),
                    TextFormField(
                      controller: _passwordController,
                      cursorColor: Color.fromARGB(255, 216, 97, 29),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29))),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 8) {
                          return 'password should be atleast 8 characters';
                        }
                        // Add password validation if needed
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0 * H,
                    ),
                    TextFormField(
                        controller: _confirmpasswordController,
                        obscureText: _obscureText,
                        cursorColor: Color.fromARGB(255, 216, 97, 29),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 216, 97, 29))),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password again';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.0 * H),
                    Center(
                      child: SizedBox(
                        width: 400.0 * W,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 30, 28, 27),
                          ),
                          onPressed: () {
                            // Handle registration logic here
                            if (_formKey.currentState!.validate()) {
                              signup();
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0 * H),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  GestureDetector(
                    onTap: widget.showloginpage,
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 243, 108, 31),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
