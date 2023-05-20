
import 'package:cuidapet/app/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule  extends Module{
  @override
  List<Bind<Object>> get binds => [];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const HomePage(),)
  ];
}