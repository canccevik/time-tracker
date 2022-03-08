import 'package:hive/hive.dart';

part 'time_record_status.g.dart';

@HiveType(typeId: 2)
enum TimeRecordStatus {
  @HiveField(0)
  initial,

  @HiveField(1)
  started, 

  @HiveField(2)
  finished 
}
