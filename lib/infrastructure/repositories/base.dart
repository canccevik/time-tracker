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
  Iterable<Model?> getAll() {
    return _box.values;
  }

  @override
  void put(String key, Model model) {
    _box.put(key, model);
  }

  @override
  void delete(String key) {
    _box.delete(key);
  }
  
  @override
  void clear() {
    _box.clear();
  }

  @override
  void add(Model model) {
    _box.add(model);
  }
}
