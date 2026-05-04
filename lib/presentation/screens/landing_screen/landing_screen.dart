import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:learning_app/presentation/widgets/animated_particles.dart';
import 'package:learning_app/presentation/widgets/app_text.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGetStarted() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, _, _) => const OnboardingScreen(),
        transitionsBuilder: (_, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                .animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.landingBackgroundStart,
                  AppColors.landingBackgroundEnd,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// 🔹 Animated Particles
          const AnimatedParticles(),

          /// 🔹 Circles
          Positioned(top: -80.h, right: -60.w, child: _circle(200)),
          Positioned(bottom: -100.h, left: -60.w, child: _circle(220)),

          /// 🔹 Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),

                /// 🎤 Pulsing Mic
                ScaleTransition(
                  scale: _pulseAnimation,
                  child: Container(
                    padding: EdgeInsets.all(25.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.landingAccentStart,
                          AppColors.landingAccentEnd,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.purple.withOpacity(0.6),
                          blurRadius: 40.r,
                          spreadRadius: 5.r,
                        ),
                      ],
                    ),
                    child: Icon(Icons.mic, color: AppColors.white, size: 40.sp),
                  ),
                ),

                SizedBox(height: 30.h),

                /// 🔹 Title
                AppText(
                  "Whisper",
                  fontSize: 31.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),

                SizedBox(height: 10.h),

                /// 🔹 Subtitle
                AppText(
                  "Real voices. Real connections.",
                  fontSize: 14.sp,
                  color: AppColors.white.withOpacity(0.6),
                ),

                const Spacer(),

                /// 🔹 Get Started
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: _onGetStarted,
                    child: Container(
                      height: 51.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        gradient: LinearGradient(
                          colors: [AppColors.primaryVariant, AppColors.primary],
                        ),
                      ),
                      child: Center(
                        child: AppText(
                          "Get Started",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15.h),

                /// 🔹 Login
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    height: 51.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Center(
                      child: AppText(
                        "Log In",
                        fontSize: 16.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 25.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        color: AppColors.purple.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
    );
  }
}
