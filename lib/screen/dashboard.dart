
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            // Implement the action for "Bag" button here
          },
        ),
      ],
    );
  }
}