import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getlocationData();
    print('this line of code is triggered');
  }

  void getlocationData() async {
    //await Geolocator.requestPermission();
    // Location location = Location();
    // await location.getCurrentLocation();
    // // latitude = location.latitude; we comment it and use it as ${location.latitude} in line no 33
    // // longitude = location.longitude;
    //
    // NetworkHelper networkHelper = NetworkHelper(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    //
    // var wetherData = await networkHelper.getdata();

    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }

  // void somethingThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater than 10 , n should always be less then 10';
  //   }
  // }

  // void getData() async {
  // http.Response response = await http.get(Uri.parse(
  //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
  // if (response.statusCode == 200) {
  //   String data = response.body;
  // var longitude = jsonDecode(data)['coord']['lon'];
  // print(longitude);
  // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
  // print(weatherDescription);
  //var decodeData = jsonDecode(data);
  // int condition = decodeData['weather'][0]['id'];
  // String cityName = decodeData['name'];
  // double temperature = decodeData['main']['temp'];
  // print(temperature);
  // print(condition);
  // print(cityName);
  //   } else {
  //     print(response.statusCode);
  //   }
}
