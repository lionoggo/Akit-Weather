import 'package:akit_weather/weather/WeatherApi.dart';
import 'package:akit_weather/weather/model/Weather.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  WeatherPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather _weather = Weather.empty();

  @override
  Widget build(BuildContext context) {
    Widget widget = _buildContentWidget();
    return Scaffold(
      body: widget,
    );
  }

  Widget _buildContentWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('images/bg_weather.jpeg', fit: BoxFit.fitHeight),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "北京",
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.white, fontSize: 35.0),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 100),
              child: new Column(
                children: <Widget>[
                  Text(_weather?.now?.tmp,
                      style: TextStyle(color: Colors.white, fontSize: 80)),
                  Text(_weather?.now?.cond_txt,
                      style: TextStyle(color: Colors.white, fontSize: 45)),
                  Text(_weather?.now?.hum,
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  Future<Null> _refreshWeather() async {
    print("重新刷新");
    await Future.delayed(Duration(seconds: 1), () {
      _getWeather();
    });
  }

  void _getWeather() async {
    WeatherApi api = new WeatherApi();
    Weather weather = await api.getWeather("北京");
    print("weather " + weather.toString());

    setState(() {
      _weather = weather;
    });
  }
}
