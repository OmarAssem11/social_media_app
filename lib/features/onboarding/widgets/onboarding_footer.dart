import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/onboarding/widgets/page_indicator.dart';
import 'package:social_media_app/generated/l10n.dart';

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
      padding: const EdgeInsets.all(Insets.l),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.register),
            child: Text(
              S.current.skip,
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
              S.current.next,
              style: textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
