import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';
import 'package:learning_app/presentation/widgets/app_text.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interests = [
    "Reading",
    "Photography",
    "Gaming",
    "Music",
    "Travel",
    "Painting",
    "Politics",
    "Charity",
    "Cooking",
    "Pets",
    "Sports",
    "Fashion",
  ];

  final Map<String, IconData> interestIcons = {
    "Music": Icons.music_note,
    "Sports": Icons.sports_soccer,
    "Travel": Icons.flight,
    "Gaming": Icons.videogame_asset,
    "Reading": Icons.menu_book,
    "Movies": Icons.movie,
    "Fitness": Icons.fitness_center,
  };

  final Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),

          /// 🔲 Card
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Title
                AppText(
                  "Select your interests",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),

                SizedBox(height: 6.h),

                /// 🔹 Subtitle
                AppText(
                  "Please select your interests",
                  fontSize: 14.sp,
                  color: AppColors.white.withOpacity(0.6),
                ),

                SizedBox(height: 20.h),

                /// 🔹 Chips Grid
                Wrap(
                  spacing: 10.w,
                  runSpacing: 12.h,
                  children: interests.map((item) {
                    final isSelected = selected.contains(item);
                    final icon = interestIcons[item] ?? Icons.star;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selected.remove(item);
                          } else {
                            selected.add(item);
                          }
                        });

                        bloc.add(NextStepEvent());
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: isSelected
                              ? AppColors.primary.withOpacity(0.2)
                              : AppColors.darkSurface,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.white.withOpacity(0.1),
                            width: 1.w, // ✅ fixed
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              icon,
                              size: 16.sp,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.white.withOpacity(0.7),
                            ),
                            SizedBox(width: 6.w),

                            AppText(
                              item,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.white.withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),

                SizedBox(height: 30.h),

                /// 🔹 Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: selected.isEmpty
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
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
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
}
