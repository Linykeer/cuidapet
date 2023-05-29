// ignore_for_file: public_member_api_docs, sort_constructors_first
class SocialNetworkModel {
  final String id;
  final String name;
  final String email;
  final String type;
  final String accessToken;
  String? avatar;
  SocialNetworkModel({
    required this.id,
    required this.name,
    required this.email,
    required this.type,
    required this.accessToken,
    this.avatar,
  });
}
