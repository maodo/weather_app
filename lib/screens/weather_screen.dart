import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String dropdownvalue = 'Abuja Nigeria';

  // List of items in our dropdown menu
  var items = [
    'Dakar Senegal',
    'Abuja Nigeria',
    'Kigali Rwanda',
    'New York USA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/blue_background.webp'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
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
                        onPressed: () {},
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
                            underline:SizedBox(),
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
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
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.barsStaggered,
                            color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                          primary: Color(0xFF232434),
                        ),
                      )
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
                    'It\'s Cloudy',
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
                        '29',
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
                      '23 km/h',
                      style: kParamTitleTextStyle,
                    ),
                    Text(
                      '30%',
                      style: kParamTitleTextStyle,
                    ),
                    Text(
                      '23 km/h',
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
