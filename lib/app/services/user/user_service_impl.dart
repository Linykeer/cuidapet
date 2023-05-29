import 'package:cuidapet/app/core/exceptions/failure.dart';
import 'package:cuidapet/app/core/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet/app/core/exceptions/user_not_exists_exception.dart';
import 'package:cuidapet/app/core/helpers/constants.dart';
import 'package:cuidapet/app/core/local_storage/local_storage.dart';
import 'package:cuidapet/app/core/logger/app_logger.dart';
import 'package:cuidapet/app/repositorys/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final AppLogger _log;
  final UserRepository _userRepository;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  UserServiceImpl(
      {required AppLogger log,
      required UserRepository userRepository,
      required LocalStorage localStorage,
      required LocalSecureStorage localSecureStorage})
      : _log = log,
        _userRepository = userRepository,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final userLoggedMethod =
          await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userLoggedMethod.isNotEmpty) {
        throw UserExistsExceptions();
      }

      await _userRepository.register(email, password);
      final userRegisterCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no firebase', e, s);
      throw Failure(message: 'Erro ao criar usúario');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userLoggedMethod =
          await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userLoggedMethod.isEmpty) {
        throw UserNotExistsException();
      }

      if (userLoggedMethod.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          await userCredential.user?.sendEmailVerification();
          throw Failure(
              message: 'E-mail não confirmado, verifique sua caixa de e-mail');
        }
        final accessToken = await _userRepository.login(email, password);
        await _saveAccessToken(accessToken);
        await _confirmLogin();
        await _getUserData();
      } else {
        throw Failure(
            message: 'Login não encontrado, por favor utilize outro método');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error(
          'Usúario ou senha inválidos FirebaseAuthError[${e.code}]', e, s);
      throw Failure(message: 'Usúario ou senha inválidos');
    }
  }

  Future<void> _saveAccessToken(String accessToken) => _localStorage
      .write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);
    await _localSecureStorage.write(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
        confirmLoginModel.refreshToken);
  }

  Future<void> _getUserData() async {
    final userModel = await _userRepository.getUserLogger();
    await _localStorage.write<String>(
        Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toJson());
  }
}
