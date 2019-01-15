import 'package:akit_weather/weather/Config.dart';
import 'package:akit_weather/weather/model/Weather.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  Future<Weather> getWeather(String city) async {
    String url = buildFullUrl(
        hostUrl: Config.baseUrl,
        url: 's6/weather/now',
        param: {"location": city, "key": Config.key});
    return _getWeather(url, city);
  }

  Future<Weather> _getWeather(String url, String city) async {
    Dio dio = new Dio(Options(responseType: ResponseType.JSON));
    Response<Map> response = await dio.get(url);

    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    }
    return Weather.empty();
  }

  String buildFullUrl({String hostUrl, String url, Map<String, String> param}) {
    if (!hostUrl.endsWith("/")) {
      throw Exception("$hostUrl must be end with/");
    }
    String result = hostUrl + url;
    if (param != null) {
      result += '?';
      param.forEach((key, value) {
        result = result + key + '=' + value + '&';
      });
    }
    if (result.endsWith("&")) {
      result = result.substring(0, result.length - 1);
    }
    print("full url = $result");

    return result;
  }
}
