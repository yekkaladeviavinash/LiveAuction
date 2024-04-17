// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final  _emailController = TextEditingController();
//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future passwordReset() async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
//           showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content:Text('Paswword reset link sent! Check your email'),
//             );
//           },
//           );
//     } on FirebaseAuthException catch (e) {
//       // showDialog(
//       //     context: context,
//       //     builder: (context) {
//       //       return AlertDialog(
//       //         content:Text(e.message.toString()),
//       //       );
//       //     },
//       //     );
//       final snackBar = SnackBar(
//             content: Text(e.message.toString()),
//             backgroundColor: Colors.red[900],
//             action: SnackBarAction(
//               label: '',
//               onPressed: () {
//                 // Some code to undo the change.
//               },
//             ),
//           );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);

//     }
//   }

//   Widget build(BuildContext context) {
//     // Set status bar color to white
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor:
//           Color.fromARGB(255, 255, 255, 255), // Make status bar transparent
//       statusBarIconBrightness:
//           Brightness.dark, // Ensure status bar icons are visible
//     ));

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 254, 254, 255),
//       extendBodyBehindAppBar: true, // Allow contents to enter status bar area
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(20, 0, 20, 0), // Add padding to top
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Enter Your Email and we will send you a password and reset link',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   controller: _emailController,
//                   cursorColor: Color.fromARGB(255, 216, 97, 29),
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     labelStyle:
//                         TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: Color.fromARGB(255, 216, 97, 29)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 MaterialButton(
//                   onPressed: passwordReset,
//                   child: Text(
//                     'Reset Password',
//                     style: TextStyle(
//                       color: Colors.orangeAccent,
//                       fontSize: 22.0,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset'),
            content:
                Text('Password reset link sent to ${_emailController.text}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.message!),
        backgroundColor: Colors.red[900],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/forget.jpg', // Assuming this is the correct path
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Enter your email to reset password',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  passwordReset(context);
                },
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}