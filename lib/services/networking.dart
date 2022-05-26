import 'package:http/http.dart';
import 'dart:convert';

class NetworkingHelper {

  final String url;
  NetworkingHelper({required this.url});

  Future getData() async{
    Response response = await get(Uri.parse(this.url));
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }
}