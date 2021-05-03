import 'dart:convert';

import 'package:api_data/WeatherModel.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<WeatherModel> getApiData() async {
  //Uri url = Uri.http("https://api.openweathermap.org/data/2.5/forecast?q=Rawalpindi&lang=en&appid=79e090231bd3e09da24e76f0d1d26159");
  http.Response response = await http
      .get(
    Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=Rawalpindi&lang=en&appid=79e090231bd3e09da24e76f0d1d26159",
    ),
  )
      .catchError((e) {
    print(e.toString());
  });
  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    var model = jsonDecode(response.body);
    print(WeatherModel.fromJson(model).toString());
    WeatherModel m = WeatherModel.fromJson(model);
    return m;
  }
}
