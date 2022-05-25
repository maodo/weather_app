import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top:300.0),
          //   child: Image(
          //     image: AssetImage('images/home_image.webp'),

          //   ),
          // ),
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
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
                  child: Text(
                    'Get to know your weather maps and radar precipitation forecast',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text('Get Started'),
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
