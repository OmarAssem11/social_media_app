import 'package:flutter/material.dart';
import 'package:social_media_app/features/onboarding/widgets/onboarding_body.dart';
import 'package:social_media_app/features/onboarding/widgets/onboarding_footer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen();

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(80),
        child: PageView(
          children: const [
            OnboardingBody(),
            OnboardingBody(),
            OnboardingBody(),
          ],
        ),
      ),
      bottomSheet: const OnboardingFooter(),
    );
  }
}
