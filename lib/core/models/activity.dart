import 'package:json_annotation/json_annotation.dart';
part 'activity.g.dart';

@JsonSerializable()
class Activity {
  const Activity(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.accessibility});

  final String? activity;
  final String? type;
  final int? participants;
  final double? price;
  final double? accessibility;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}
