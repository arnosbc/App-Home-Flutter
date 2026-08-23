import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/widgets/auth_widgets.dart';
import 'package:flutter_application_home/ui/login/widgets/input_login.dart';

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Inputlogin(
                    controller: txtUser,
                    title: 'Correo electrónico',
                    hintText: 'tu@correo.com',
                    prefixIcon: Icons.alternate_email_rounded,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value == null || !value.contains('@')
                        ? 'Escribe un correo válido'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Inputlogin(
                        controller: txtPassword,
                        title: 'Contraseña',
                        hintText: 'Tu contraseña',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: _hidePassword,
                        textInputAction: TextInputAction.done,
                        validator: (value) => value == null || value.length < 6
                            ? 'Usa al menos 6 caracteres'
                            : null,
                      ),
                      IconButton(
                        onPressed: () =>
                            setState(() => _hidePassword = !_hidePassword),
                        icon: Icon(
                          _hidePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: fern,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('¿Olvidaste tu contraseña?'),
                    ),
                  ),
                  const SizedBox(height: 6),
                  AuthPrimaryButton(
                    label: 'Entrar a mi espacio',
                    onPressed: _submit,
                  ),
                  const SizedBox(height: 18),
                  const AuthDivider(),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: AuthSocialButton(
                          icon: Icons.g_mobiledata_rounded,
                          label: 'Google',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: AuthSocialButton(
                          icon: Icons.apple,
                          label: 'Apple',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
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
