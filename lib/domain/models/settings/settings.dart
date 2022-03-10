import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class SettingsModel extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int firstDayOfTheWeek;

  @HiveField(1, defaultValue: 0)
  int workingPeriod;

  @HiveField(2, defaultValue: 1)
  int dailyWorkingHours;

  @HiveField(3, defaultValue: false)
  bool isFlexibleWorker;

  @HiveField(4)
  String? appLanguage;

  SettingsModel({
    required this.firstDayOfTheWeek,
    required this.workingPeriod,
    required this.dailyWorkingHours,
    required this.isFlexibleWorker,
    this.appLanguage,
  });

  static SettingsModel get initial => SettingsModel(
    firstDayOfTheWeek: 0,
    workingPeriod: 0,
    dailyWorkingHours: 1,
    isFlexibleWorker: false
  );

  SettingsModel copyWith({
    int? firstDayOfTheWeek,
    int? workingPeriod,
    int? dailyWorkingHours,
    bool? isFlexibleWorker,
    String? appLanguage
  }) {
    return SettingsModel(
      firstDayOfTheWeek: firstDayOfTheWeek ?? this.firstDayOfTheWeek,
      workingPeriod: workingPeriod ?? this.workingPeriod,
      dailyWorkingHours: dailyWorkingHours ?? this.dailyWorkingHours,
      isFlexibleWorker: isFlexibleWorker ?? this.isFlexibleWorker,
      appLanguage: appLanguage ?? this.appLanguage
    );
  }
}
