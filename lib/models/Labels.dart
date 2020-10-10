// To parse this JSON data, do
//
//     final labels = labelsFromJson(jsonString);

import 'dart:convert';

List<Labels> labelsFromJson(String str) =>
    List<Labels>.from(json.decode(str).map((x) => Labels.fromJson(x)));

String labelsToJson(List<Labels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Labels {
  Labels({
    this.category,
    this.labels,
  });

  String category;
  List<String> labels;

  factory Labels.fromJson(Map<String, dynamic> json) => Labels(
        category: json["category"],
        labels: List<String>.from(json["labels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "labels": List<dynamic>.from(labels.map((x) => x)),
      };
}
