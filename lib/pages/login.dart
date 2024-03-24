import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveauction/pages/forgot_pw_page.dart';
class login extends StatefulWidget {
  final VoidCallback showregisterpage;
  const login({super.key, required this.showregisterpage});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();

  Future signIn()async{
    //loadingc circle
  //   showDialog(context: context, builder: (context){
  //     return Center(child: CircularProgressIndicator());
  //   },
  // );
    
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  
    // Navigator.of(context).pop(); //popping the loading circle
  }


  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // Set status bar color to white
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 255, 255, 255), // Make status bar transparent
      statusBarIconBrightness: Brightness.dark, // Ensure status bar icons are visible
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 254, 255),
      extendBodyBehindAppBar: true, // Allow contents to enter status bar area
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0), // Add padding to top
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/login.jpg',
                    // height: 380.0,
                    scale: 1.2,
                    fit: BoxFit.fill,
                  ),
                ),
                const Text(
                  'Log-in',
                  style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _emailController,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _passwordController,
                  cursorColor: Color.fromARGB(255, 216, 97, 29),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Make sure there is no one behind 🧐',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height:2.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Add your button onPressed logic here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:(context){
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: Text(
                            'forgot password ?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 243, 108, 31),
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:12.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 28, 27),
                  ),
                  onPressed: () {
                    // Replace this with authentication logic
                    signIn();
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    GestureDetector(
                      onTap:widget.showregisterpage,
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          'Register',
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
      ),
    );
  }
}
