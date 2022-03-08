import 'package:hive/hive.dart';

import 'package:time_tracker/domain/repositories/base.dart';

class BaseRepository<Model> extends AbstractBaseRepository<Model> {
  final Box<Model?> _box;

  BaseRepository(this._box);
  
  @override
  Model? get(dynamic key) {
    return _box.get(key);
  }

  @override
  Iterable<Model?> getAll() {
    return _box.values;
  }

  @override
  Future<void> put(dynamic key, Model model) async {
    await _box.put(key, model);
  }

  @override
  Future<void> delete(dynamic key) async {
    await _box.delete(key);
  }
  
  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<Model?> add(Model model) async {
    int key = await _box.add(model);
    return get(key);
  }
}
