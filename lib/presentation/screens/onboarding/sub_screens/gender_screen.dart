import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';
import 'package:learning_app/presentation/widgets/app_text.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),

          /// 🔲 Card Container
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.3),
                  blurRadius: 30.r, // ✅ fixed
                  offset: Offset(0, 12.h), // ✅ fixed
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// 🔹 Title
                AppText(
                  "What’s Your Gender?",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),

                SizedBox(height: 6.h),

                /// 🔹 Subtitle
                AppText(
                  "Tell us about your gender",
                  fontSize: 14.sp,
                  color: AppColors.white.withOpacity(0.6),
                ),

                SizedBox(height: 30.h),

                /// 🔹 Gender Options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _genderButton(
                      label: "Male",
                      icon: Icons.male,
                      isSelected: selectedGender == "Male",
                      onTap: () {
                        setState(() => selectedGender = "Male");
                        bloc.add(UpdateGenderEvent("Male"));
                      },
                    ),
                    _genderButton(
                      label: "Female",
                      icon: Icons.female,
                      isSelected: selectedGender == "Female",
                      onTap: () {
                        setState(() => selectedGender = "Female");
                        bloc.add(UpdateGenderEvent("Female"));
                      },
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                /// 🔹 Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: selectedGender == null
                        ? null
                        : () {
                            bloc.add(NextStepEvent());
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.primary.withOpacity(
                        0.3,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      elevation: 0,
                    ),
                    child: AppText(
                      'Continue',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Gender Button
  Widget _genderButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 100.w,
        height: 100.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.primary.withOpacity(0.15)
              : AppColors.darkSurface,
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.white.withOpacity(0.1),
            width: 2.w, // ✅ fixed
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32.sp,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.white.withOpacity(0.7),
            ),
            SizedBox(height: 8.h),
            AppText(
              label,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.primary
                  : AppColors.white.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
