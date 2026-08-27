import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/widgets/auth_widgets.dart';
import 'package:flutter_application_home/ui/login/widgets/login_forms.dart';
import 'package:flutter_application_home/ui/theme.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController txtUser = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _acceptTerms = false;

  @override
  void dispose() {
    txtUser.dispose();
    txtPassword.dispose();
    txtConfirmPassword.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false) || !_acceptTerms) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Acepta los términos para continuar')),
        );
      }
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cuenta creada. Bienvenido a Verde')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            eyebrow: 'Un buen comienzo',
            title: 'Crea tu lugar\nen Verde.',
            subtitle:
                'Un pequeño paso para empezar a vivir tus ideas con más calma.',
          ),
          AuthFormCard(
            child: RegisterForm(
              formKey: _formKey,
              userController: txtUser,
              passwordController: txtPassword,
              confirmPasswordController: txtConfirmPassword,
              hidePassword: _hidePassword,
              acceptTerms: _acceptTerms,
              onTogglePassword: () =>
                  setState(() => _hidePassword = !_hidePassword),
              onTermsChanged: (value) => setState(() => _acceptTerms = value),
              onSubmit: _submit,
            ),
          ),
          const SizedBox(height: Space.md),
          AuthSwitch(
            prompt: '¿Ya tienes una cuenta?',
            action: 'Iniciar sesión',
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
