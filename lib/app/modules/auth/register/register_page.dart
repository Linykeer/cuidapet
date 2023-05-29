import 'package:cuidapet/app/core/UI/extensions/size_screen_extension.dart';
import 'package:cuidapet/app/core/UI/widgets/cuidapet_default_button.dart';
import 'package:cuidapet/app/core/UI/widgets/cuidapet_textformfield.dart';
import 'package:cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';
part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cadastrar Usúario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
            const _RegisterForm(),
          ],
        ),
      ),
    );
  }
}
