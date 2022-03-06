abstract class AbstractBaseRepository<Model> {
  Model? get(String key);
  
  void put(String key, Model model);

  void delete(String key);

  void clear();

  void add(Model model);

  Iterable<Model?> getAll();
}
