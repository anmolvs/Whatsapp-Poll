import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';
import 'package:word_cloud/word_cloud_view.dart';

import '../apis.dart';
import '../model.dart';

class getWordCloud extends StatefulWidget {
  const getWordCloud({super.key});

  @override
  State<getWordCloud> createState() => _getWordCloudState();
}

late Future<List<Summary>> summaryResponse;

class _getWordCloudState extends State<getWordCloud> {
  @override
  void initState() {
    summaryResponse = Api().getSummarizedResponse();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Summary>>(
      future: summaryResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color.fromARGB(
                    255,
                    245,
                    250,
                    253,
                  ),
                ),
                strokeWidth: 4,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: WordCloudView(
                    data: WordCloudData(data: wordCloudData),
                    mapcolor: Color.fromARGB(255, 255, 255, 255),
                    mintextsize: 20,
                    maxtextsize: 50,
                    mapwidth: 750,
                    mapheight: 450,
                    // fontWeight: FontWeight.bold,
                    colorlist: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.purple,
                      Colors.teal,
                      Colors.pink,
                      Colors.amber,
                      Colors.indigo,
                      Colors.lime,
                      Colors.cyan,
                      Colors.deepOrange,
                      Colors.deepPurple,
                      Colors.lightBlue,
                      Colors.lightGreen,
                      Colors.deepPurpleAccent,
                      Colors.lightBlueAccent,
                      Colors.lightGreenAccent,
                      Colors.deepOrangeAccent,
                      Colors.amberAccent,
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
