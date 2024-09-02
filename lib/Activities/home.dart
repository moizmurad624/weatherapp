import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/classDirectory/worker.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? mainTemp;
  String? mainHumidity;
  String? mainDescription;
  String? mainSpeed;
  String? cityLocations;
  String? countryValue = "";
  String? stateValue = "";
  String? cityValue = "";

  void startApp() async {
    worker instance = worker(locationCity: cityValue);
    await instance.getHttp();

    setState(() {
      cityLocations = instance.locationCity;
      mainTemp = instance.mainTemperature;
      mainHumidity = instance.humidity;
      mainDescription = instance.weatherDescription;
      mainSpeed = instance.windSpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: CSCPicker(
              layout: Layout.horizontal,
              showStates: true,
              showCities: true,
              flagState: CountryFlag.DISABLE,
              // defaultCountry: CscCountry.Pakistan,
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged: (value) {
                if (value != null) {
                  setState(() {
                    stateValue = value;
                  });
                }
              },
              onCityChanged: (value) {
                setState(() {
                  if (value != null &&
                      (cityValue != 'City' || stateValue != 'State')) {
                    cityValue = value;
                    startApp();
                  }

                  if(cityValue != 'City' || stateValue!='State'){
                    startApp();
                  }
                });
              },
            ),
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            cityLocations == null ? 'loading' : cityLocations!,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            mainTemp == null
                ? 'Main Temperature: loading'
                : 'Main Temperature: $mainTemp F',
          ),
          Text(
            mainHumidity == null
                ? 'Humidity: loading'
                : 'Humidity: $mainHumidity',
          ),
          Text(
            mainSpeed == null
                ? 'Wind Speed: loading'
                : 'Wind Speed: $mainSpeed m/s',
          ),
          Text(
            mainDescription == null
                ? 'Weather Description: loading'
                : 'Weather Description: ${mainDescription?.toUpperCase()}',
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/loading');
                          },
            child: const Text("Click here for loading page"),
          )

        ],
      ),
    );
  }
}