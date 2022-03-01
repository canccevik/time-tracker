import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class SettingsModel {
  @HiveField(0, defaultValue: 0)
  final int firstDayOfTheWeek;

  @HiveField(1, defaultValue: 0)
  final int workingPeriod;

  @HiveField(2, defaultValue: 1)
  final int dailyWorkingHours;

  @HiveField(3, defaultValue: false)
  final bool isFlexibleWorker;

  SettingsModel({
    required this.firstDayOfTheWeek,
    required this.workingPeriod,
    required this.dailyWorkingHours,
    required this.isFlexibleWorker
  });

  static get initial => SettingsModel(
    firstDayOfTheWeek: 0,
    workingPeriod: 0,
    dailyWorkingHours: 1,
    isFlexibleWorker: false
  );

  SettingsModel copyWith({
    int? firstDayOfTheWeek,
    int? workingPeriod,
    int? dailyWorkingHours,
    bool? isFlexibleWorker
  }) {
    return SettingsModel(
      firstDayOfTheWeek: firstDayOfTheWeek ?? this.firstDayOfTheWeek,
      workingPeriod: workingPeriod ?? this.workingPeriod,
      dailyWorkingHours: dailyWorkingHours ?? this.dailyWorkingHours,
      isFlexibleWorker: isFlexibleWorker ?? this.isFlexibleWorker
    );
  }
}
