import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:word_cloud/word_cloud_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Cloud Example Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Word Cloud Example Page'),
    );
  }
}



class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // Example word cloud data
List<String> words = ['word1', 'word2', 'word3'];
List<int> frequencies = [10, 20, 30];
    List<Map<String, dynamic>> wordCloudData = [];

    for (int i = 0; i < words.length; i++) {
      wordCloudData.add({
        'word': words[i],
        'value': frequencies[i],
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WordCloudView(
              data: WordCloudData(data: wordCloudData),
              mapcolor: const Color.fromARGB(255, 174, 183, 235),
              mapwidth: 500,
              mapheight: 500,
              fontWeight: FontWeight.bold,
              colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
            ),
          ],
        ),
      ),
    );
  }
}
