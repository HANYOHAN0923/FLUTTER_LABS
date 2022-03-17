import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;

class WeatherImage extends StatefulWidget {
  const WeatherImage({Key? key}) : super(key: key);

  @override
  State<WeatherImage> createState() => _WeahterImageState();
}

class _WeahterImageState extends State<WeatherImage> {
  var weather_info = <String?>[];
  var info = '';
  var image_path = '';

  void _getDataFromWeb() async {
    final response = await http.get(Uri.parse(
        'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=군포시+날씨'));

    dom.Document document = parse.parse(response.body);

    setState(() {
      final web_info = document.getElementsByClassName('temperature_info');
      weather_info = web_info
          .map((element) => element.getElementsByTagName('p')[0].innerHtml)
          .toList();
      var info_ko = weather_info[0]!.replaceAll(RegExp('[^가-힣]'), '');
      info = info_ko.replaceAll(RegExp('[어,제,보,다,낮,아,요,오,늘,높]'), '');

      switch (info) {
        case '맑음':
          image_path = 'assets/NB01.png';
          break;
        case '맑음 (밤)':
          image_path = 'assets/NB01_N.png';
          break;
        case '구름조금 (낮)':
          image_path = 'assets/NB02.png';
          break;
        case '구름조금 (밤)':
          image_path = 'assets/NB02_N.png';
          break;
        case '구름많음 (낮)':
          image_path = 'assets/NB0e.png';
          break;
        case '구름많음 (밤)':
          image_path = 'assets/NB03_N.png';
          break;
        case '흐림':
          image_path = 'assets/NB04.png';
          break;
      }
      print(image_path);
    });
  }

  @override
  void initState() {
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset(image_path));
  }
}
