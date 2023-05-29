import 'package:cuidapet/app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @readonly
  UserModel? _userLogged;
  @action
  Future<void> loadUserLogged() async {
    _userLogged = UserModel.empty();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        _userLogged = UserModel.fromMap({});
      },
    );
  }
}
