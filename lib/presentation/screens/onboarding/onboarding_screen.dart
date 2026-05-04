import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_state.dart';
import 'package:learning_app/presentation/screens/onboarding/sub_screens/age_screen.dart';
import 'package:learning_app/presentation/screens/onboarding/sub_screens/gender_screen.dart';
import 'package:learning_app/presentation/screens/onboarding/sub_screens/intrests_screen.dart';
import 'package:learning_app/presentation/screens/onboarding/sub_screens/name_screen.dart';
import 'package:learning_app/presentation/screens/onboarding/sub_screens/phone_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listenWhen: (prev, curr) => prev.currentIndex != curr.currentIndex,
      listener: (context, state) {
        _controller.animateToPage(
          state.currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
      child: WillPopScope(
        onWillPop: () async {
          final bloc = context.read<OnboardingBloc>();

          if (_controller.hasClients && (_controller.page ?? 0) > 0) {
            bloc.add(PreviousStepEvent());
            return false; // prevent exiting
          }

          return true; // allow exit on first screen
        },
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 50),

              /// 🔢 Step Indicator
              AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  int currentStep = 1;

                  if (_controller.hasClients && _controller.page != null) {
                    currentStep = (_controller.page! + 1).round();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Step $currentStep of 5",
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.6),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 10),

              /// 🔥 Progress Bar (smooth)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    double progress = 0;

                    if (_controller.hasClients && _controller.page != null) {
                      progress = (_controller.page! + 1) / 5;
                    } else {
                      progress = 1 / 5;
                    }

                    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.primary,
                      value: progress,
                      minHeight: 6,
                    );
                  },
                ),
              ),

              const SizedBox(height: 6),

              /// 🔥 Pages
              Expanded(
                child: PageView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PhoneScreen(),
                    NameScreen(),
                    AgeScreen(),
                    GenderScreen(),
                    InterestsScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
