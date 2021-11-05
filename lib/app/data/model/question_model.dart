// To parse this JSON data, do
//
//     final markerModel = markerModelFromJson(jsonString);

import 'dart:convert';

QuestionModel markerModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String markerModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.result,
  });

  List<Questions>? result;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    result: List<Questions>.from(json["result"].map((x) => Questions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Questions {
  Questions({
    this.id,
    this.answer,
    this.question,
    this.options,
  });

  String? id;
  int? answer;
  String? question;
  List<String>? options;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
    id: json["id"],
    answer: json["answer"],
    question: json["question"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "answer": answer,
    "question": question,
    "options": List<dynamic>.from(options!.map((x) => x)),
  };
}


const List sample_data = [
  {
    "id": "1",
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": "2",
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": "3",
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": "4",
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];