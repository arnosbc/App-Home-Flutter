import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/widgets/auth_widgets.dart';
import 'package:flutter_application_home/ui/login/widgets/input_login.dart';

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
                        hintText: 'Mínimo 6 caracteres',
                        prefixIcon: Icons.lock_outline_rounded,
                        obscureText: _hidePassword,
                        textInputAction: TextInputAction.next,
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
                  const SizedBox(height: 16),
                  Inputlogin(
                    controller: txtConfirmPassword,
                    title: 'Repite tu contraseña',
                    prefixIcon: Icons.verified_user_outlined,
                    obscureText: _hidePassword,
                    textInputAction: TextInputAction.done,
                    validator: (value) => value != txtPassword.text
                        ? 'Las contraseñas no coinciden'
                        : null,
                  ),
                  CheckboxListTile(
                    value: _acceptTerms,
                    onChanged: (value) =>
                        setState(() => _acceptTerms = value ?? false),
                    contentPadding: EdgeInsets.zero,
                    activeColor: fern,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Acepto los términos y la política de privacidad',
                      style: TextStyle(fontSize: 12, color: Color(0xFF668071)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  AuthPrimaryButton(
                    label: 'Crear mi cuenta',
                    onPressed: _submit,
                    icon: Icons.spa_outlined,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
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
