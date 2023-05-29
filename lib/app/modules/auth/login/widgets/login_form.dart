part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final controller = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();
  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CuidapetTextformfield(
              label: 'E-mail',
              controller: _loginEC,
              validator: Validatorless.multiple([
                Validatorless.required('E-mail obrigatorio'),
                Validatorless.email('E-mail inválido'),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            CuidapetTextformfield(
              label: 'Senha',
              obscureText: true,
              controller: _passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatoria'),
                Validatorless.min(
                    6, 'Senha deve conter pelo menos 6 caracteres'),
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            CuidapetDefaultButton(
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    await controller.login(
                        email: _loginEC.text, password: _passwordEC.text);
                  }
                },
                label: 'Entrar'),
            const _OrSeparator(),
          ],
        ));
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: context.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'OU',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: context.primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
