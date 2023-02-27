import 'dart:convert';

import 'package:http/http.dart' as http;

class TestApi {
  Future<dynamic> getData(String number) async {
    Uri url = Uri.parse('http://numbersapi.com/$number');
    try {
      http.Response response = await http.get(url);
      String data = response.body;

      return data;
    } on Exception catch (e) {
      print(e);
    }
  }
}
