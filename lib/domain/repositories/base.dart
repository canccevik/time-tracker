abstract class AbstractBaseRepository<Model> {
  Model? get(dynamic key);
  
  Future<void> put(String key, Model model);

  Future<void> delete(String key);

  Future<void> clear();

  Future<Model?> add(Model model);

  Iterable<Model?> getAll();
}
