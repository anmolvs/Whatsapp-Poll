import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poll_app/apis.dart';

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Response Table',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

Future<List<Summary>> fetchData() async {
  final response = await http.get(Uri.parse(summarizedApiUrl));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

late Future<List<Summary>> summaryResponse;

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    summaryResponse = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Response Table'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> data = snapshot.data!;
            // return DataTable(
            //   columns: <DataColumn>[
            //     DataColumn(label: Text('ID')),
            //     DataColumn(label: Text('Name')),
            //     DataColumn(label: Text('Email')),
            //   ],
            //   rows: data
            //       .map((item) => DataRow(cells: <DataCell>[
            //             DataCell(Text(data["_id"])),
            //             DataCell(Text(item['count'].toString())),
            //             DataCell(Text(item['email'].toString())),
            //           ]))
            //       .toList(),
            // );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
