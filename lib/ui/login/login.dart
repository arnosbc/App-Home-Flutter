import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/widgets/auth_widgets.dart';
import 'package:flutter_application_home/ui/login/widgets/login_forms.dart';
import 'package:flutter_application_home/ui/theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  void dispose() {
    txtUser.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sesión iniciada correctamente')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            eyebrow: 'Tu espacio personal',
            title: 'Qué bueno verte\nde nuevo.',
            subtitle: 'Entra y vuelve a conectar con todo lo que te importa.',
          ),
          AuthFormCard(
            child: LoginForm(
              formKey: _formKey,
              userController: txtUser,
              passwordController: txtPassword,
              hidePassword: _hidePassword,
              onTogglePassword: () =>
                  setState(() => _hidePassword = !_hidePassword),
              onSubmit: _submit,
            ),
          ),
          const SizedBox(height: Space.md),
          AuthSwitch(
            prompt: '¿Aún no tienes una cuenta?',
            action: 'Crear cuenta',
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    );
  }
}
