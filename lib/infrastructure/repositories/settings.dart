import 'package:hive/hive.dart';

import 'package:time_tracker/infrastructure/repositories/base.dart';
import 'package:time_tracker/domain/repositories/settings.dart';
import 'package:time_tracker/domain/models/settings/settings.dart';

class SettingsRepository extends BaseRepository<SettingsModel> implements AbstractSettingsRepository<SettingsModel> {
  SettingsRepository(Box<SettingsModel> box) : super(box);
}
