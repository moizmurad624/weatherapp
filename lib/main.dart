import 'package:flutter/material.dart';
import 'package:weatherapp/Activities/home.dart';
import 'package:weatherapp/Activities/loading.dart';
import 'package:weatherapp/Activities/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/loading',


      routes: {
          '/loading': (context) => const locations(),
          '/home': (context) => const home(),
          '/location': (context) => const location(),
    },

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}
