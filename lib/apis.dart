import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:poll_app/model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

// List<Map> data_list = [];
List<Map<String, dynamic>> wordCloudData = [];

Dio dio = Dio();

String baseUrl = "https://hq8p5sgghg.execute-api.ap-south-1.amazonaws.com/dev";

final questionApiUrl = "${baseUrl}/events/questions/E27032024";

final responseApiUrl =
    "https://0b06cfcf-2c18-4821-a2de-4b1b57c34cf8.mock.pstmn.io";

final summarizedApiUrl = "${baseUrl}/events/summarized-response?question=2";

final nextQuestionApiUrl = "${baseUrl}/events/next-question";

final detailedApiUrl = "${baseUrl}/events/detailed-response?question=2";

class Api {
  Future<List<Question>> getQuestion() async {
    try {
      final response = await http.get(Uri.parse(questionApiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        //  print(data);
        List<Question> questions =
            data.map((question) => Question.fromJson(question)).toList();
        return questions;
      } else {
        print('Failed to load JSON file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching JSON file: $e');
    }
    throw Exception('Failed to Load');
  }

  Future<List<Summary>> getSummarizedResponse() async {
    try {
      final response = await http.get(
        Uri.parse(summarizedApiUrl),
        headers: {
          "businessphone": "+918860825375",
          "eventid": "E001",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        for (int i = 0; i < data.length; i++) {
          wordCloudData.add({
            'word': data[i]['_id'],
            'value': data[i]['count'],
          });
        }
        List<Summary> summary_data =
            data.map((summary) => Summary.fromJson(summary)).toList();
        return summary_data;
      } else {
        print('Failed to load JSON file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching JSON file: $e');
      print(e);
    }
    throw Exception('Failed to Load');
  }

  Future<List<Detailed>> getDetailedResponse() async {
    try {
      final response = await http.get(
        Uri.parse(detailedApiUrl),
        headers: {
          "businessphone": "+918860825375",
          "eventid": "E001",
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        List<Detailed> detailed_data =
            data.map((detail) => Detailed.fromJson(detail)).toList();
        return detailed_data;
      } else {
        print('Failed to load JSON file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching JSON file: $e');
      print(e);
    }
    throw Exception('Failed to Load');
  }

//   Future<List<Responses>> getResponses() async {
//     try {
//       final responsedata = await http.get(Uri.parse(responseApiUrl));

//       if (responsedata.statusCode == 200) {
//         final List<dynamic> data = json.decode(responsedata.body);
//         // print(responsedata.body);
//         List<Responses> responses =
//             data.map((response) => Responses.fromJson(response)).toList();
//         // print(responses[0].response);
//         Map<String, int> mp = {};
//         for (int i = 0; i < 50; i++) {
//           mp.update(responses[i].response, (value) => value + 1,
//               ifAbsent: () => 1);
//         }

//         List<String> words = ['anmol'];
//         List<int> frequencies = [10];

//         mp.forEach((key, value) {
//           words.add(key);
//           frequencies.add(value);
//         });

//         for (int i = 0; i < mp.length; i++) {
//           wordCloudData.add({
//             'word': words[i],
//             'value': frequencies[i],
//           });
//         }
//         return responses;
//       } else {
//         print('Failed to load JSON file: ${responsedata.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching JSON file: $e');
//     }
//     throw Exception('Failed to Load');
//   }
// }
}

Future<void> nextQuestionTrigger() async {
  try {
    final response = await http.post(
      Uri.parse(nextQuestionApiUrl),
      // body: {},
      headers: {
        "businessphone": "+918860825375",
        "eventid": "E001",
      },
    );

    if (response.statusCode == 200) {
      print("Next Question Triggered..");
    } else {
      print('Failed to load JSON file: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching JSON file: $e');
    print(e);
  }
  //throw Exception('Failed to Load');
}
