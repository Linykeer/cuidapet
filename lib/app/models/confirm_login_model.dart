import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ConfirmLoginModel {
  final String accessToken;
  final String refreshToken;
  ConfirmLoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory ConfirmLoginModel.fromMap(Map<String, dynamic> map) {
    return ConfirmLoginModel(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfirmLoginModel.fromJson(String source) =>
      ConfirmLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
