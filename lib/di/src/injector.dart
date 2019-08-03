import 'injector_exception.dart';
import 'type_factory.dart';

typedef T ObjectFactoryFn<T>(Injector injector);
typedef T ObjectFactoryWithParamsFn<T>(
    Injector injector, Map<String, dynamic> additionalParameters);

class Injector {
  static final Map<String, Injector> _injectors = Map<String, Injector>();
  final Map<String, TypeFactory<Object>> _factories =
  new Map<String, TypeFactory<Object>>();

  final String name;

  static Injector getInjector([String name = "default"]) {
    if (!_injectors.containsKey(name)) {
      _injectors[name] = new Injector._internal(name);
    }

    return _injectors[name];
  }

  Injector._internal(this.name);

  String _makeKey<T>(T type, [String key]) =>
      "${type.toString()}::${key == null ? "default" : key}";

  void map<T>(ObjectFactoryFn<T> factoryFn,
      {bool isSingleton = false, String key}) {
    final objectKey = _makeKey(T, key);
    if (_factories.containsKey(objectKey)) {
      throw new InjectorException(
          "Mapping already present for type '$objectKey'");
    }
    _factories[objectKey] =
    new TypeFactory<T>((i, p) => factoryFn(i), isSingleton);
  }

  void mapWithParams<T>(ObjectFactoryWithParamsFn<T> factoryFn, {String key}) {
    final objectKey = _makeKey(T, key);
    if (_factories.containsKey(objectKey)) {
      throw new InjectorException(
          "Mapping already present for type '$objectKey'");
    }
    _factories[objectKey] = new TypeFactory<T>(factoryFn, false);
  }

  T get<T>({String key, Map<String, dynamic> additionalParameters}) {
    final objectKey = _makeKey(T, key);
    final objectFactory = _factories[objectKey];
    if (objectFactory == null) {
      throw new InjectorException(
          "Cannot find object factory for '$objectKey'");
    }

    return objectFactory.get(this, additionalParameters);
  }

  /// Gets all the mapped instances of the given type and additional parameters
  Iterable<T> getAll<T>({Map<String, dynamic> additionalParameters}) {
    final keyForType = _makeKey(T).replaceFirst("default", "");
    final instances = new List<T>();
    _factories.forEach((k, f) {
      if (k.contains(keyForType)) {
        instances.add(f.get(this, additionalParameters));
      }
    });

    return instances;
  }

  /// Disposes of the injector instance and removes it from the named collection of injectors
  void dispose() {
    _factories.clear();
    _injectors.remove(name);
  }
}