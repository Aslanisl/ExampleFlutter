import 'package:json_annotation/json_annotation.dart';

abstract class ApiResponse<T> {
  @JsonKey(name: "Message")
  String? error;
  @JsonKey(name: "Results")
  List<T>? results;

  ApiResponse(Map<String, dynamic> json) {
    final results = json['Results'] as List<dynamic>?;
    if (results != null && results.isNotEmpty && (results.first as Map<String, dynamic>?) != null) {
      final first = results.first as Map<String, dynamic>;
      if (first["Message"] != null) {
        this.error = first["Message"];
      } else {
        this.results = results.map((e) => fromJson(e as Map<String, dynamic>)).toList();
      }
    }
  }

  T fromJson(Map<String, dynamic> json);
}
