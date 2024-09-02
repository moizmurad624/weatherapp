import 'package:dio/dio.dart';
import 'package:weatherapp/weatherApiModal.dart';



class worker{

  String? locationCity;

  worker({this.locationCity}){
    locationCity = locationCity;
  }

  String?  mainTemperature;
  String?  humidity;
  String?  windSpeed;
  String? weatherDescription;
  int?  sysID;

  final dio = Dio();

  getHttp() async {

    try{
      final weatherResponse = await dio.get('https://api.openweathermap.org/data/2.5/weather?q=$locationCity&appid=0d3fe7dd1534e0408fe76b2bc9c39936');
      currentWeatherData weatherData = currentWeatherData.fromJson(weatherResponse.data);

        mainTemperature = weatherData.main?.temp.toString();
        humidity = weatherData.main?.humidity.toString();
        windSpeed = weatherData.wind?.speed.toString();
        weatherDescription = weatherData.weather?[0].description;
        sysID = weatherData.sys?.id;

    }
    catch(e){
      mainTemperature = "Can't Find Main Temperature";
      humidity = "Can't Find Humidity";
      windSpeed = "Can't Find Wind Speed";
      weatherDescription = "Can't Find Weather Description";
    }

  }


}

