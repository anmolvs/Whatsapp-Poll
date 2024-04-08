class Question {
  final String id;
  final String question;
  final String event_id;
  final int question_number;
  Question(
      {required this.id,
      required this.question,
      required this.event_id,
      required this.question_number});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['_id'],
        question: json['text'],
        event_id: json['event_id'],
        question_number: json['question_number']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'event_id': event_id,
      'question_number': question_number
    };
  }
}

class Summary {
  final String answer;
  final int frequency;
  Summary({required this.answer, required this.frequency});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(answer: json['_id'], frequency: json['count']);
  }
  Map<String, dynamic> toMap() {
    return {'answer': answer, 'frequency': frequency};
  }
}

class Detailed {
  final String id;
  final String contact;
  final String name;
  final String response;
  //final String responseType;

  Detailed({
    required this.id,
    required this.contact,
    required this.name,
    required this.response,
    //required this.responseType
  });

  factory Detailed.fromJson(Map<String, dynamic> json) {
    return Detailed(
      id: json['_id'],
      contact: json['user_phone'],
      name: json['user_name'],
      response: json['answer'],
      //responseType: json['response-type']
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contact': contact,
      'name': name,
      'response': response,
      //'responseType': responseType,
    };
  }
}
