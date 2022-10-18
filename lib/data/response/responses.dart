// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: "userSubject")
  String? userSubject;
  @JsonKey(name: "userMessage")
  String? userMessage;
  MessageResponse({
    this.userSubject,
    this.userMessage,
  });

  // from json
  factory MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
