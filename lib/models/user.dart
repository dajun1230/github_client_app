import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  String? login;
    String? avatar_url;
    String? type;
    String? name;
    String? company;
    String? blog;
    String? location;
    String? email;
    bool? hireable;
    String? bio;
    num? public_repos;
    num? followers;
    num? following;
    String? created_at;
    String? updated_at;
    num? total_private_repos;
    num? owned_private_repos;
    
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}