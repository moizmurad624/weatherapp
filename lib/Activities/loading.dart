// loading.dart

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class locations extends StatefulWidget {
  const locations({super.key});



  @override
  State<locations> createState() => _locationsState();
}

class _locationsState extends State<locations> {

  void startApp(){
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, '/');
    },);
  }

@override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('Images/Logo.jpg'),
            ),
            SizedBox(height: 30, width: double.infinity,),
            Text("Weather App", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            )),
            SizedBox(height: 30, width: double.infinity,),
            Text("Created by - MOIZ MURAD", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            )),
            SizedBox(height: 30, width: double.infinity,),
        SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
          ],
        ),
      )
    );
  }
}
