import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/color_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({required this.index});

  final int index;

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Sizes.s12,
          width: Sizes.s12,
          decoration: BoxDecoration(
            color: widget.index == 1
                ? ColorManager.primary
                : ColorManager.lightGrey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: Sizes.s8),
        Container(
          height: Sizes.s12,
          width: Sizes.s12,
          decoration: BoxDecoration(
            color: widget.index == 2
                ? ColorManager.primary
                : ColorManager.lightGrey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: Sizes.s8),
        Container(
          height: Sizes.s12,
          width: Sizes.s12,
          decoration: BoxDecoration(
            color: widget.index == 3
                ? ColorManager.primary
                : ColorManager.lightGrey,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
