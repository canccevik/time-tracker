import 'package:hive/hive.dart';

part 'time_record.g.dart';

@HiveType(typeId: 1)
class TimeRecordModel {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final DateTime startDate;

  @HiveField(2)
  final DateTime stopDate;

  @HiveField(3)
  final int totalTime;

  @HiveField(4, defaultValue: false)
  final bool isItOffDay;

  TimeRecordModel({
    required this.date,
    required this.startDate,
    required this.stopDate,
    required this.totalTime,
    required this.isItOffDay
  });
}
