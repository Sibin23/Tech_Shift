import 'dart:ui';
import 'dart:async'; // Importing dart:async for Timer
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shift/core/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is the new UI", // Placeholder for the new UI
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
