import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.keyboardType,
    this.validator,
    this.maxLines,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.s12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s20)),
          ),
          errorStyle: const TextStyle(fontSize: Sizes.s12),
        ),
        autocorrect: false,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}
