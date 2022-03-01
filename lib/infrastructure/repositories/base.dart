import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/base.dart';

class BaseRepository<Model> extends AbstractBaseRepository<Model> {
  final Box<Model?> box;

  BaseRepository(this.box);
  
  @override
  Model? get(String key) {
    return box.get(key);
  }

  @override
  void put(String key, Model value) {
    box.put(key, value);
  }

  @override
  void delete(String key) {
    box.delete(key);
  }

  @override
  void clear() {
    box.clear();
  }
}
