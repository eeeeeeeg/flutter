import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart' show rootBundle;
class WordRoute extends StatelessWidget {

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/test.png",
                fit: BoxFit.cover,
              ),
              Text(wordPair.toString()),
              
            ],
            
          ),
        ),
      ),
    );
  }
}
