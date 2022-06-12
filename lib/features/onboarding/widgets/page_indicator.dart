import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/color_manager.dart';
import 'package:social_media_app/core/presentation/values_manager.dart';

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
          height: AppSize.s12,
          width: AppSize.s12,
          decoration: BoxDecoration(
            color: widget.index == 1
                ? ColorManager.primary
                : ColorManager.lightGrey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSize.s8),
        Container(
          height: AppSize.s12,
          width: AppSize.s12,
          decoration: BoxDecoration(
            color: widget.index == 2
                ? ColorManager.primary
                : ColorManager.lightGrey,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSize.s8),
        Container(
          height: AppSize.s12,
          width: AppSize.s12,
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
