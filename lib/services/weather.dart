import 'networking.dart';

const appKey = '0db506ce0633ebbc2df93f14d086c1b1';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var parsedCityName = this.parseCityName(cityName);
    var url = '$openWeatherMapUrl?q=$parsedCityName&appid=$appKey&units=metric';
    NetworkingHelper networkingHelper = NetworkingHelper(url:url);
    var weatherData = await networkingHelper.getData();
    print(weatherData);
    return weatherData;
  }

  String parseCityName(String cityName){
    List<String> cityList = cityName.split(' ');
    print(cityList[0]);
    return cityList[0];
  }
}