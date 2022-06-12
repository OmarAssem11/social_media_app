import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/util/routes_manager.dart';
import 'package:social_media_app/core/presentation/util/strings_manager.dart';
import 'package:social_media_app/core/presentation/util/values_manager.dart';
import 'package:social_media_app/features/onboarding/widgets/page_indicator.dart';

class OnboardingFooter extends StatefulWidget {
  const OnboardingFooter();

  @override
  State<OnboardingFooter> createState() => _OnboardingFooterState();
}

class _OnboardingFooterState extends State<OnboardingFooter> {
  int _index = 1;
  late TextTheme textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(Insets.i20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.register),
            child: Text(
              AppStrings.skip,
              style: textTheme.bodyMedium,
            ),
          ),
          Center(
            child: PageIndicator(
              index: _index,
            ),
          ),
          TextButton(
            onPressed: () => setState(
              () => _index++,
            ),
            child: Text(
              AppStrings.next,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
