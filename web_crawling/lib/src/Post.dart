import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var title = <String>[];
  var post = <String>[];
  var link = <String?>[];

  final String _content = 'https://www.weather.go.kr/w/index.do';

  void _shareContent() {
    Share.share(_content);
  }

  void _getDataFromWeb() async {
    final response =
        await http.get(Uri.parse('https://arprogramming.blogspot.com'));

    dom.Document document = parse.parse(response.body);

    setState(() {
      final elements =
          document.getElementsByClassName('entry-header blog-entry-header');
      title = elements
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      final content = document.getElementsByClassName('entry-content');
      post = content
          .map((element) => element.getElementsByTagName("p")[0].innerHtml)
          .toList();

      final web_link = document.getElementsByClassName('entry-title');
      link = web_link
          .map((element) =>
              element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
  }

  @override
  void initState() {
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: post.length == 0
            ? Text("No Data", style: TextStyle(color: Colors.white))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                        child: Container(
                                      child: Column(
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: _shareContent,
                                            icon: Icon(Icons.share),
                                            label: Text('Share'),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(title[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                  fontSize: 20,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(post[index],
                                              style: TextStyle(
                                                  color: Colors.black))
                                        ],
                                      ),
                                    )),
                                  ),
                                  onTap: () async {
                                    dynamic url = link[index];

                                    if (await canLaunch(url))
                                      launch(url);
                                    else {
                                      print('error');
                                    }
                                  }))));
                },
                itemCount: post.length,
              ));
  }
}
