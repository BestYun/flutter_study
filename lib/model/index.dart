import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class Index extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  String data;

  Index(
    this.code,
    this.data,
  );

  factory Index.fromJson(Map<String, dynamic> srcJson) =>
      _$IndexFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndexToJson(this);
}
