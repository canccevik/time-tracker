import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/base.dart';

abstract class AbstractTimeRecordRepository<Model> extends AbstractBaseRepository<Model> {
  AbstractTimeRecordRepository(Box box);
}
