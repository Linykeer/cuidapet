import 'package:cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:cuidapet/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => RegisterController(
            log: i(),
            userService: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const RegisterPage())
      ];
}
