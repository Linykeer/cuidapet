import 'package:cuidapet/app/modules/auth/register/register_module.dart';
import 'package:cuidapet/app/modules/auth/splash/auth_splash_page.dart';
import 'package:cuidapet/app/modules/auth/login/login_module.dart';
import 'package:cuidapet/app/repositorys/user/user_repository.dart';
import 'package:cuidapet/app/repositorys/user/user_repository_impl.dart';
import 'package:cuidapet/app/services/user/user_service.dart';
import 'package:cuidapet/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            log: i(),
            restClient: i(),
          ),
        ),
        Bind.lazySingleton<UserService>(
          (i) => UserServiceImpl(
            log: i(),
            userRepository: i(),
            localStorage: i(),
            localSecureStorage: i(),
          ),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => AuthSplashPage(
            authStore: Modular.get(),
          ),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
        ),
        ModuleRoute(
          '/register',
          module: RegisterModule(),
        )
      ];
}
