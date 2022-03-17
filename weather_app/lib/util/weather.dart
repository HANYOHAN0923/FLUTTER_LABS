import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var weather = <String>[];
  var currentTemp = '';

  var airPollution = <String>[];
  var finedust = '';
  var superFinedust = '';
  var ultraviolet = '';

  void _getDataFromWeb() async {
    final response = await http.get(Uri.parse(
        'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=군포시+날씨'));

    dom.Document document = parse.parse(response.body);

    setState(() {
      // 온도
      final temp = document.getElementsByClassName('temperature_text');
      weather = temp
          .map((element) => element.getElementsByTagName('strong')[0].innerHtml)
          .toList();

      currentTemp = weather[0].replaceAll(RegExp('[^0-9]'), '');

      // 미세먼지 초미세먼지 자외선
      final airpol = document.getElementsByClassName('item_today level1');
      airPollution = airpol
          .map((element) => element.getElementsByTagName('span')[0].innerHtml)
          .toList();

      finedust = airPollution[0];
      superFinedust = airPollution[1];
      ultraviolet = airPollution[2];
    });
  }

  @override
  void initState() {
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: [
        Text('현재 기온은 ${currentTemp}도 입니다.'),
        Text('미세먼지: ${finedust}'),
        Text('초미세먼지: ${superFinedust}'),
        Text('자외선: ${ultraviolet}')
      ],
    )));
  }
}
