import 'base_service.dart';

class ServiceRegistry {
  ServiceRegistry({
    required this._services,
  });

  final List<BaseService> _services;

  Future<void> initializeAll() async {
    for (final BaseService service in _services) {
      await service.initialize();
    }
  }
}