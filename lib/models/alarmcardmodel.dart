import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

part 'alarmcardmodel.g.dart';

@HiveType(typeId: 1)
class AlarmModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final TimeOfDay time;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final bool isEnabled;
  @HiveField(4)
  final bool isdeleted;

  AlarmModel({
    required this.id,
    required this.title,
    required this.time,
    this.isEnabled = true,
    this.isdeleted = false,
  });

  @override
  String toString() {
    return '$title $time';
  }
}
