// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = 'Loading...';
  String email = 'Loading...';
  String profileImageUrl = 'assets/dummy-profile-pic.png';

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid;

    if (userId != null) {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(userId);
      userDoc.get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          final userData = documentSnapshot.data();
          setState(() {
            name = userData?['name'] ?? 'Name not Found';
            email = userData?['email'] ?? 'Email not Found';
            if (userData?['profileImageUrl'] != null) {
              profileImageUrl = userData?['profileImageUrl'];
            }
          });
        }
      }).catchError((error) {
        print('Error Fetching Data');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title:
                const Text('My Profile', style: TextStyle(color: Colors.white)),
            titleSpacing: 00.0,
            toolbarHeight: 60,
            toolbarOpacity: 0.8,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            elevation: 0.00,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                  // Implement the action for "My Account" button here
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(name)],
          )),
    );
  }
}
