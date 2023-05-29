import 'package:cuidapet/app/core/UI/extensions/size_screen_extension.dart';
import 'package:cuidapet/app/models/user_model.dart';
import 'package:cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AuthSplashPage extends StatefulWidget {
  final AuthStore _authStore;
  const AuthSplashPage({Key? key, required AuthStore authStore})
      : _authStore = authStore,
        super(key: key);

  @override
  State<AuthSplashPage> createState() => _AuthSplashPageState();
}

class _AuthSplashPageState extends State<AuthSplashPage> {
  @override
  void initState() {
    super.initState();
    reaction<UserModel?>((p0) => widget._authStore.userLogged, (userLogger) {
      if (userLogger != null && userLogger.email.isNotEmpty) {
        Modular.to.navigate('/home');
      } else {
        Modular.to.navigate('/auth/login');
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._authStore.loadUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 162.w,
          height: 130.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
