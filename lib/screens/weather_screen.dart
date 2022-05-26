import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.weatherData});
  final weatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String dropdownvalue = 'Dakar Senegal';
  bool status = false;
  int temperature = 0;
  int humidity = 0;
  double speed = 0;
  var description;
  WeatherModel weatherModel = WeatherModel();
  // List of items in our dropdown menu
  var items = [
    'Dakar Senegal',
    'Abuja Nigeria',
    'Kigali Rwanda',
    'New York USA',
  ];

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      humidity = weatherData['main']['humidity'];
      speed = weatherData['wind']['speed'];
      description = weatherData['weather'][0]['description'];
    });
  }
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('images/blue_background.webp'),
          //       fit: BoxFit.cover,
          //       colorFilter: ColorFilter.mode(
          //         Colors.white.withOpacity(0.8),
          //         BlendMode.dstATop,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(FontAwesomeIcons.barsStaggered,
                            color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          primary: Color(0xFF232434),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          DropdownButton(
                            underline: SizedBox(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            onChanged: (String? newValue) async {
                              print(newValue);
                              var weatherData =
                                  await weatherModel.getCityWeather(newValue!);
                              setState(() {
                                dropdownvalue = newValue;
                                updateUI(weatherData);
                              });
                            },
                            // Initial Value
                            value: dropdownvalue,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: FlutterSwitch(
                          height: 38.0,
                          activeColor: Color(0xFF232434),
                          inactiveColor: Colors.white,
                          activeIcon: Icon(
                            Icons.nightlight_round,
                            color: Colors.blueAccent,
                          ),
                          inactiveIcon: Icon(
                            Icons.wb_sunny,
                            color: Colors.yellow,
                          ),
                          value: status,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Today\'s report',
                    style: kWeatherTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                  ),
                  child: Image(
                    image: AssetImage('images/cloudy_weather.webp'),
                  ),
                ),
                Center(
                  child: Text(
                    '$description',
                    textAlign: TextAlign.center,
                    style: kHomeTitleTextStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Text(
                        '$temperature',
                        textAlign: TextAlign.center,
                        style: kTemperatureTextStyle,
                      ),
                    ),
                    Text(
                      '°',
                      textAlign: TextAlign.center,
                      style: kTempDeg,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(
                        'images/cloud.webp',
                      ),
                      width: 100.0,
                      height: 100.0,
                    ),
                    Image(
                      image: AssetImage(
                        'images/sun.webp',
                      ),
                      width: 68.0,
                      height: 68.0,
                    ),
                    Image(
                      image: AssetImage(
                        'images/rain.webp',
                      ),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$speed km/h',
                      style: kParamTitleTextStyle,
                    ),
                    Text(
                      '$humidity%',
                      style: kParamTitleTextStyle,
                    ),
                    Text(
                      '$speed km/h',
                      style: kParamTitleTextStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        top: 10.0,
                      ),
                      child: Text('Sun', style: kSubTitleTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        top: 10.0,
                      ),
                      child: Text('Humidity', style: kSubTitleTextStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Text(
                        'Chance of rain',
                        style: kSubTitleTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
