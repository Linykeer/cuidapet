import 'package:cuidapet/app/core/UI/widgets/loader.dart';
import 'package:cuidapet/app/core/UI/widgets/messages.dart';
import 'package:cuidapet/app/core/exceptions/failure.dart';
import 'package:cuidapet/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;
  LoginControllerBase({
    required AppLogger log,
    required UserService userService,
  })  : _log = log,
        _userService = userService;

  Future<void> login({required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.login(email, password);
      Loader.hide();
    } on Failure catch (e, s) {
      final errorMessage = e.message ?? 'Erro ao realizar login';
      _log.error(errorMessage, e, s);
      Loader.hide();
      Messages.error(errorMessage);
    } on UserNotExistsException {
      _log.error('Usúario não cadastrado');
      Loader.hide();
      Messages.error('Usúario não cadastrado');
    }
  }
}
