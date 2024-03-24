import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailPage extends StatelessWidget {
  final String username;

  UserDetailPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: username)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('User not found'));
          }

          Map<String, dynamic> userData = snapshot.data!.docs.first.data() as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${userData['name']}'),
                Text('Email: ${userData['email']}'),
                // Add more fields as needed
              ],
            ),
          );
        },
      ),
    );
  }
}
