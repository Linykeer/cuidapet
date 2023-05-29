part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm>
    with WidgetsBindingObserver {
  final controller = Modular.get<RegisterController>();
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CuidapetTextformfield(
                label: 'E-mail',
                controller: _loginEC,
                validator: Validatorless.multiple([
                  Validatorless.required('Login Obrigatório'),
                  Validatorless.email('Login deve conter um e-mail válido'),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              CuidapetTextformfield(
                label: 'Senha',
                controller: _passwordEC,
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha Obrigatória'),
                  Validatorless.min(
                      6, 'Senha deve contem no minimo 6 caracteres'),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              CuidapetTextformfield(
                label: 'Confirma Senha',
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required('Confirma senha obrigatória'),
                  Validatorless.min(
                      6, 'Confirma senha deve conter no minimo 6 caracters'),
                  Validatorless.compare(
                      _passwordEC, 'Senha e confirma senha não são iguais'),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              CuidapetDefaultButton(
                  onPressed: () {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      controller.register(
                          email: _loginEC.text, password: _passwordEC.text);
                    }
                  },
                  label: 'Cadastrar'),
            ],
          ),
        ));
  }
}
