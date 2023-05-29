import 'package:cuidapet/app/core/local_storage/flutter_secure_storage/flutter_secure_storage_local_storage_impl.dart';
import 'package:cuidapet/app/core/local_storage/local_storage.dart';
import 'package:cuidapet/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/core/logger/app_logger_impl.dart';
import 'package:cuidapet/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:cuidapet/app/core/rest_client/rest_client.dart';
import 'package:cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AppLogger>(
          (i) => AppLoggerImpl(),
          export: true,
        ),
        Bind.lazySingleton<LocalStorage>(
          (i) => SharedPreferencesLocalStorageImpl(),
          export: true,
        ),
        Bind.lazySingleton<LocalSecureStorage>(
          (i) => FlutterSecureStorageLocalStorageImpl(),
          export: true,
        ),
        Bind.factory<RestClient>(
          (i) => DioRestClient(localStorage: i(), log: i()),
          export: true,
        ),
        Bind.lazySingleton(
          (i) => AuthStore(),
          export: true,
        ),
      ];
}
