import 'package:cuidapet/app/core/UI/extensions/size_screen_extension.dart';
import 'package:cuidapet/app/core/UI/extensions/theme_extensions.dart';
import 'package:cuidapet/app/core/UI/icons/cuidapet_icons.dart';
import 'package:cuidapet/app/core/UI/widgets/cuidapet_default_button.dart';
import 'package:cuidapet/app/core/UI/widgets/cuidapet_textformfield.dart';
import 'package:cuidapet/app/core/UI/widgets/rounded_button_with_icon.dart';
import 'package:cuidapet/app/core/helpers/environments.dart';
import 'package:cuidapet/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';

class LoginPage extends StatelessWidget {
  final textEC = TextEditingController();
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(Environments.param('base_url') ?? ''),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const _LoginForm(),
              _LoginRegisterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
