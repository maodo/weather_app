import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';

import 'weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/home_image.webp'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
                  child: Text(
                    'Discover the weather in your city',
                    textAlign: TextAlign.center,
                    style: kHomeTitleTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Get to know your weather maps and\nradar precipitation forecast',
                    textAlign: TextAlign.center,
                    style: kHomeDescriptionTextStyle,
                    
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return WeatherScreen();
                      }))
                    },
                    child: Text(
                      'Get Started',
                      style: kHomeButtonTextStyle,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          double.maxFinite,
                          57.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
