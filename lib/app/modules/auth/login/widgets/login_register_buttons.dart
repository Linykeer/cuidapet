part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  const _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      direction: Axis.horizontal,
      children: [
        RoundedButtonWithIcon(
            onTap: () {},
            width: .42.sw,
            color: const Color(0xff4267b3),
            icon: CuidapetIcons.facebook,
            label: 'Facebook'),
        RoundedButtonWithIcon(
            onTap: () {},
            width: .42.sw,
            color: const Color(0xffE15031),
            icon: CuidapetIcons.facebook,
            label: 'Google'),
        RoundedButtonWithIcon(
            onTap: () {
              Navigator.pushNamed(context, '/auth/register');
            },
            width: .42.sw,
            color: context.primaryColorDark,
            icon: Icons.mail,
            label: 'Cadastre-se'),
      ],
    );
  }
}
