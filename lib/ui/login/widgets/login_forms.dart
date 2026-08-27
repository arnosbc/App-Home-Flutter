import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/login/widgets/auth_widgets.dart';
import 'package:flutter_application_home/ui/login/widgets/input_login.dart';
import 'package:flutter_application_home/ui/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.userController,
    required this.passwordController,
    required this.hidePassword,
    required this.onTogglePassword,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final bool hidePassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Inputlogin(
            controller: userController,
            title: 'Correo electrónico',
            hintText: 'tu@correo.com',
            prefixIcon: Icons.alternate_email_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: _emailValidator,
          ),
          const SizedBox(height: Space.md),
          PasswordField(
            controller: passwordController,
            hintText: 'Tu contraseña',
            hidePassword: hidePassword,
            onTogglePassword: onTogglePassword,
            textInputAction: TextInputAction.done,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('¿Olvidaste tu contraseña?'),
            ),
          ),
          const SizedBox(height: Space.sm),
          AuthPrimaryButton(label: 'Entrar a mi espacio', onPressed: onSubmit),
          const SizedBox(height: Space.md),
          const AuthDivider(),
          const SizedBox(height: Space.md),
          const SocialButtons(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.userController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.hidePassword,
    required this.acceptTerms,
    required this.onTogglePassword,
    required this.onTermsChanged,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool hidePassword;
  final bool acceptTerms;
  final VoidCallback onTogglePassword;
  final ValueChanged<bool> onTermsChanged;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Inputlogin(
            controller: userController,
            title: 'Correo electrónico',
            hintText: 'tu@correo.com',
            prefixIcon: Icons.alternate_email_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: _emailValidator,
          ),
          const SizedBox(height: Space.md),
          PasswordField(
            controller: passwordController,
            hintText: 'Mínimo 6 caracteres',
            hidePassword: hidePassword,
            onTogglePassword: onTogglePassword,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: Space.md),
          Inputlogin(
            controller: confirmPasswordController,
            title: 'Repite tu contraseña',
            prefixIcon: Icons.verified_user_outlined,
            obscureText: hidePassword,
            textInputAction: TextInputAction.done,
            validator: (value) => value != passwordController.text
                ? 'Las contraseñas no coinciden'
                : null,
          ),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              value: acceptTerms,
              onChanged: (value) => onTermsChanged(value ?? false),
              contentPadding: EdgeInsets.zero,
              activeColor: AppColors.fern,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Acepto los términos y la política de privacidad',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: Space.sm),
          AuthPrimaryButton(
            label: 'Crear mi cuenta',
            onPressed: onSubmit,
            icon: Icons.spa_outlined,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hidePassword,
    required this.onTogglePassword,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hintText;
  final bool hidePassword;
  final VoidCallback onTogglePassword;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Inputlogin(
          controller: controller,
          title: 'Contraseña',
          hintText: hintText,
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: hidePassword,
          textInputAction: textInputAction,
          validator: (value) => value == null || value.length < Space.sm
              ? 'Usa al menos 6 caracteres'
              : null,
        ),
        IconButton(
          onPressed: onTogglePassword,
          icon: Icon(
            hidePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.fern,
          ),
        ),
      ],
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AuthSocialButton(
            icon: Icons.g_mobiledata_rounded,
            label: 'Google',
          ),
        ),
        SizedBox(width: Space.sm),
        Expanded(
          child: AuthSocialButton(icon: Icons.apple, label: 'Apple'),
        ),
      ],
    );
  }
}

String? _emailValidator(String? value) {
  return value == null || !value.contains('@')
      ? 'Escribe un correo válido'
      : null;
}
