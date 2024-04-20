import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:liveauction/pages/forgot_pw_page.dart';

class login extends StatefulWidget {
  final VoidCallback showregisterpage;
  const login({super.key, required this.showregisterpage});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  Future signIn() async {
    //loadingc circle
    //   showDialog(context: context, builder: (context){
    //     return Center(child: CircularProgressIndicator());
    //   },
    // );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Get.snackbar(
        'Welcome',
        'Logged in Successfully',
        colorText: Colors.white,
        backgroundColor: Colors.black87,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Invalid Credentials',
        colorText: Colors.white,
        backgroundColor: Colors.black87,
      );
    }
    // Navigator.of(context).pop(); //popping the loading circle
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar color to white
    Size screenSize = MediaQuery.of(context).size;
    double W = screenSize.width;
    double H = screenSize.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Color.fromARGB(255, 255, 255, 255), // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Ensure status bar icons are visible
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 255),
      extendBodyBehindAppBar: true, // Allow contents to enter status bar area
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20 * (W / 448), 0, 20 * (W / 448), 0), // Add padding to top
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/login1.jpg',
                    height: 400 * (H / 974.3),
                    width: 400 * (W / 448),
                    scale: 1,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 30.4 * (W / 411),
                  ),
                ),
                SizedBox(height: 8 * (H / 890.2)),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        cursorColor: Color.fromARGB(255, 216, 97, 29),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 30, 28, 27),
                              fontSize: 16 * (W / 411.3),
                              fontWeight: FontWeight.w100),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20 * (H / 890.2)),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: Color.fromARGB(255, 216, 97, 29),
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Make sure there is no one behind 🧐',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16 * (W / 411.3),
                              fontWeight: FontWeight.w100),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2 * (H / 890.2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //                   Get.snackbar(
                        //   'Success',
                        //   'You are successfully registered',
                        //   colorText: Colors.white,
                        //   backgroundColor: Colors.black87,
                        // );
                        // Add your button onPressed logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(4 * (W / 411)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8 * (W / 411)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 4 * (W / 411), 0),
                          child: Text(
                            'Forgot password ?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 243, 108, 31),
                              fontSize: 14 * (W / 411),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12 * (H / 890.2)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 28, 27),
                  ),
                  onPressed: () {
                    // Replace this with authentication logic
                    if (_formKey.currentState!.validate()) signIn();
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 10 * (H / 890.2), 0, 10 * (H / 890.2)),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22 * (W / 411),
                          // fontWeight: FontWeight.w200
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10 * (H / 890.2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    GestureDetector(
                      onTap: widget.showregisterpage,
                      child: Container(
                        padding: EdgeInsets.all(4 * (W / 411)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8 * (W / 411)),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Color.fromARGB(255, 243, 108, 31),
                            fontSize: 16 * (W / 411),
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
      ),
    );
  }
}
