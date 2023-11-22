import 'package:flutter/material.dart';
import 'package:flutter_firebase/screen/myprofile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Flutter Firebase',
              style: TextStyle(color: Colors.white)),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          elevation: 0.00,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyProfile()));
                // Implement the action for "My Account" button here
              },
            ),
          ],
        ),
        body: const Center(
          child: Text('Flutter Firebase Basics'),
        ),
      ),
    );
  }
}
