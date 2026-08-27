import 'package:flutter/material.dart';
import 'package:flutter_application_home/ui/theme.dart';

class Inputlogin extends StatelessWidget {
  const Inputlogin({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: AppColors.forest,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: title,
        hintText: hintText,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: AppColors.fern, size: Space.md),
      ),
    );
  }
}
