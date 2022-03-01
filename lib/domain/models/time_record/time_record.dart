import 'package:hive/hive.dart';

part 'time_record.g.dart';

@HiveType(typeId: 1)
class TimeRecordModel {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final DateTime startDate;

  @HiveField(2)
  final DateTime? stopDate;

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

  static TimeRecordModel get initial => TimeRecordModel(
    date: DateTime.now(),
    startDate: DateTime.now(),
    stopDate: null,
    totalTime: 0,
    isItOffDay: false
  );

  TimeRecordModel copyWith({
    DateTime? date,
    DateTime? startDate,
    DateTime? stopDate,
    int? totalTime,
    bool? isItOffDay
  }) {
    return TimeRecordModel(
      date: date ?? this.date,
      startDate: startDate ?? this.startDate,
      stopDate: stopDate ?? this.stopDate,
      totalTime: totalTime ?? this.totalTime,
      isItOffDay: isItOffDay ?? this.isItOffDay
    );
  }
}
