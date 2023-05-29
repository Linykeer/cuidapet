import 'package:cuidapet/app/core/life_cycle/controller_life_cycle.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  @override
  Future<void> onReady() async {
    await hastRegisteredAddress();
    super.onReady();
  }

  Future<void> hastRegisteredAddress() async {
    await Modular.to.pushNamed('/address');
  }
}
