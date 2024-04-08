// import 'package:flutter/material.dart';
// import 'package:poll_app/apis.dart';
// import 'package:word_cloud/word_cloud_data.dart';
// import 'package:word_cloud/word_cloud_shape.dart';
// import 'package:word_cloud/word_cloud_tap.dart';
// import 'package:word_cloud/word_cloud_tap_view.dart';
// import 'package:word_cloud/word_cloud_view.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Word Cloud Example Page',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Word Cloud Example Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> data_list = [];

//     List<String> words = ['word1', 'word2', 'word3'];
//     List<double> frequencies = [10, 20, 30];

//     for (int i = 0; i < words.length; i++) {
//       data_list.add({
//         'word': words[i],
//         'frequency': frequencies[i],
//       });
//     }

//     WordCloudData wcdata = WordCloudData(data: data_list);

//   return Scaffold(
      
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             WordCloudView(
//               data: WordCloudData(data: wcdata),
//               mapcolor: const Color.fromARGB(255, 174, 183, 235),
//               mapwidth: 500,
//               mapheight: 500,
//               fontWeight: FontWeight.bold,
//               colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
