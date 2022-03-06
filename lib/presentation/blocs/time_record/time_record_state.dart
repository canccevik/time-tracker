import 'package:time_tracker/domain/models/time_record/time_record.dart';

class TimeRecordState {
  final TimeRecordModel timeRecord;
  final List<TimeRecordModel> timeRecords;

  TimeRecordState({
    required this.timeRecord,
    this.timeRecords = const <TimeRecordModel>[]
  });

  TimeRecordState copyWith({
    TimeRecordModel? timeRecord,
    List<TimeRecordModel>? timeRecords
  }) {
    return TimeRecordState(
      timeRecord: timeRecord ?? this.timeRecord,
      timeRecords: timeRecords ?? this.timeRecords
    );
  }
}
