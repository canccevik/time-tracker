import 'package:hive/hive.dart';

import 'package:time_tracker/domain/models/time_record/time_record_status/time_record_status.dart';

part 'time_record.g.dart';

@HiveType(typeId: 1)
class TimeRecordModel extends HiveObject {
  @HiveField(0)
  DateTime? date;

  @HiveField(1)
  DateTime? startDate;

  @HiveField(2)
  DateTime? stopDate;

  @HiveField(3)
  int totalTimeInMs;

  @HiveField(4, defaultValue: false)
  bool isItOffDay;

  @HiveField(5)
  TimeRecordStatus status;

  TimeRecordModel({
    required this.date,
    required this.startDate,
    this.stopDate,
    this.totalTimeInMs = 0,
    this.isItOffDay = false,
    this.status = TimeRecordStatus.initial
  });

  static TimeRecordModel get initial => TimeRecordModel(
    date: null,
    startDate: null,
    stopDate: null,
    totalTimeInMs: 0
  );
}
