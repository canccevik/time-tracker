import 'package:hive/hive.dart';

part 'time_record.g.dart';

enum TimeRecordStatus { initial, started, finished }

@HiveType(typeId: 1)
class TimeRecordModel extends HiveObject {
  @HiveField(0)
  final DateTime? date;

  @HiveField(1)
  final DateTime? startDate;

  @HiveField(2)
  final DateTime? stopDate;

  @HiveField(3)
  final int totalTimeInMs;

  @HiveField(4, defaultValue: false)
  final bool isItOffDay;

  @HiveField(5)
  TimeRecordStatus status;

  TimeRecordModel({
    required this.date,
    required this.startDate,
    required this.stopDate,
    required this.totalTimeInMs,
    this.isItOffDay = false,
    this.status = TimeRecordStatus.initial
  });

  static TimeRecordModel get initial => TimeRecordModel(
    date: null,
    startDate: null,
    stopDate: null,
    totalTimeInMs: 0
  );

  TimeRecordModel copyWith({
    DateTime? date,
    DateTime? startDate,
    DateTime? stopDate,
    int? totalTimeInMs,
    bool? isItOffDay,
    TimeRecordStatus? status
  }) {
    return TimeRecordModel(
      date: date ?? this.date,
      startDate: startDate ?? this.startDate,
      stopDate: stopDate ?? this.stopDate,
      totalTimeInMs: totalTimeInMs ?? this.totalTimeInMs,
      isItOffDay: isItOffDay ?? this.isItOffDay,
      status: status ?? this.status
    );
  }
}
