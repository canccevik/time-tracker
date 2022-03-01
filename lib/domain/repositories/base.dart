abstract class AbstractBaseRepository<Model> {
  Model? get(String key);
  
  void put(String key, Model value);

  void delete(String key);

  void clear();
}
