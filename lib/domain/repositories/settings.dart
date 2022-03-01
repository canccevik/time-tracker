import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/base.dart';

abstract class AbstractSettingsRepository<Model> extends AbstractBaseRepository<Model> {
  AbstractSettingsRepository(Box box);
}
