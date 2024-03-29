import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/color_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.label,
    required this.onPressed,
    required this.isLoading,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            screenSize.width,
            .06 * screenSize.height,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.s20)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator(
              color: ColorManager.white,
            )
          : Text(label.toUpperCase()),
    );
  }
}
