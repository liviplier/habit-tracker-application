import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/screens/forms/login_screen.dart';
import 'package:habit_tracker/screens/forms/signup_screen.dart';
import 'package:habit_tracker/screens/widgets/buttons.dart';
import 'package:habit_tracker/screens/widgets/theme_changer.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to My Habit Tracker",
            body:
                "My Habit Tracker is your personal assistant to daily self-care",
            image: Image.asset("assets/images/meditating.png"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Form and quit habits",
            body: "Track your mood with an intelligent habit tracker",
            image: Image.asset("assets/images/painting.png"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Reflect on your days",
            body: "see what makes you happy or sad",
            image: Image.asset("assets/images/cooking.png"),
            decoration: pageDecoration(),
          ),
          PageViewModel(
            title: "Check your progress",
            body:
                "Get an overview of how you are performing to motivate yourself and achieve more",
            image: Image.asset("assets/images/stretching.png"),
            decoration: pageDecoration(),
            footer: Row(
              children: [
                ButtonWidget(
                  width: 100,
                  onPressed: goToSignUp(context),
                  text: "Sign Up",
                ),
                const SizedBox(
                  width: 20,
                ),
                ButtonWidget(
                  width: 100,
                  onPressed: goToLogin(context),
                  text: "Login",
                ),
              ],
            ),
          ),
        ],
        showSkipButton: true,
        skip: const Text("Skip Intro"),
      ),
    );
  }

  PageDecoration pageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontFamily: "Libre Baskerville",
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: const TextStyle(
          fontSize: 20,
        ),
        bodyPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: isDark ? AppColors.darkMode : AppColors.lightMode,
      );

  goToSignUp(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  goToLogin(context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginScreen()));
  }
}
