import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/base.dart';

class BaseRepository<Model> extends AbstractBaseRepository<Model> {
  final Box<Model?> _box;

  BaseRepository(this._box);
  
  @override
  Model? get(String key) {
    return _box.get(key);
  }

  @override
  void put(String key, Model value) {
    _box.put(key, value);
  }

  @override
  void delete(String key) {
    _box.delete(key);
  }

  @override
  void clear() {
    _box.clear();
  }
}
