// loading.dart
import 'package:flutter/material.dart';

class location extends StatelessWidget {
  const location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Center(
          child: Text("Location page"),
        ),
      ),
    );
  }
}


