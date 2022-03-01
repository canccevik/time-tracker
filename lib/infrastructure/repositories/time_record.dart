import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/time_record.dart';
import 'package:time_tracker/infrastructure/repositories/base.dart';
import 'package:time_tracker/domain/models/time_record/time_record.dart';

class TimeRecordRepository extends BaseRepository<TimeRecordModel> implements AbstractTimeRecordRepository<TimeRecordModel> {
  TimeRecordRepository(Box<TimeRecordModel> box) : super(box);
}
