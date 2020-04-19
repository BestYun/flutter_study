import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'age')
  int age;

  User(
    this.username,
    this.age,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "username = $username age = $age";
  }
}
