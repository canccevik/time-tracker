import 'package:time_tracker/domain/models/time_record/time_record.dart';

class TimeState {
  final TimeRecordModel currentRecord;
  Iterable<TimeRecordModel?> records, dailyRecords;
  int additionalTimeInMs;

  TimeState({
    required this.currentRecord,
    this.records = const <TimeRecordModel?>[],
    this.dailyRecords = const <TimeRecordModel?>[],
    this.additionalTimeInMs = 0
  });

  TimeState copyWith({
    TimeRecordModel? currentRecord,
    Iterable<TimeRecordModel?>? records,
    Iterable<TimeRecordModel?>? dailyRecords,
    int? additionalTimeInMs,
  }) {
    return TimeState(
      currentRecord: currentRecord ?? this.currentRecord,
      records: records ?? this.records,
      dailyRecords: dailyRecords ?? this.dailyRecords,
      additionalTimeInMs: additionalTimeInMs ?? this.additionalTimeInMs
    );
  }
}
