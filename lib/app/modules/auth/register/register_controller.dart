// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet/app/core/UI/widgets/loader.dart';
import 'package:cuidapet/app/core/UI/widgets/messages.dart';
import 'package:cuidapet/app/core/exceptions/user_exists_exceptions.dart';
import 'package:mobx/mobx.dart';

import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final AppLogger _log;
  final UserService _userService;
  RegisterControllerBase({
    required AppLogger log,
    required UserService userService,
  })  : _log = log,
        _userService = userService;

  Future<void> register(
      {required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Messages.info(
          'Enviamos um e-mail de confirmação, por favor olhe sua caixa de e-mail');
      Loader.hide();
    } on UserExistsExceptions {
      Loader.hide();
      Messages.error('E-mail já utilizado, por favor escolha outro');
    } catch (e, s) {
      _log.error('Erro ao registrar usúario', e, s);
      Loader.hide();
      Messages.error('Erro ao registrar usúario');
    }
  }
}
