import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';
import 'package:learning_app/presentation/widgets/app_text.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final FixedExtentScrollController _controller = FixedExtentScrollController(
    initialItem: 10,
  );

  int selectedIndex = 10;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),

          /// 🔲 Card Container
          Container(
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
              color: AppColors.deepSurface,
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.35),
                  blurRadius: 34.r,
                  offset: Offset(0, 18.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Title
                AppText(
                  'How Old Are You ?',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),

                SizedBox(height: 8.h),

                /// 🔹 Subtitle
                AppText(
                  'Please provide your age in years',
                  fontSize: 14.sp,
                  color: AppColors.white.withOpacity(0.65),
                ),

                SizedBox(height: 28.h),

                /// 🎡 Wheel Picker
                SizedBox(
                  height: 220.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ListWheelScrollView.useDelegate(
                        controller: _controller,
                        itemExtent: 48.h,
                        physics: const FixedExtentScrollPhysics(),
                        perspective: 0.0015,
                        onSelectedItemChanged: (index) {
                          setState(() => selectedIndex = index);
                          bloc.add(UpdateAgeEvent(18 + index));
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (context, index) {
                            final age = 18 + index;
                            final isSelected = index == selectedIndex;

                            return Center(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 180),
                                style: TextStyle(
                                  fontSize: isSelected ? 35.sp : 20.sp,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.white.withOpacity(0.45),
                                ),
                                child: Text(age.toString()),
                              ),
                            );
                          },
                        ),
                      ),

                      /// 🔹 Center Indicator Line
                      Container(
                        height: 50.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 70.w),
                        color: AppColors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Divider(
                              color: AppColors.white.withOpacity(0.3),
                              thickness: 1.5,
                            ),
                            Divider(
                              color: AppColors.white.withOpacity(0.3),
                              thickness: 1.5,
                            ),
                          ],
                        ),
                      ),

                      /// 🔹 Top Fade
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.deepSurface,
                                AppColors.deepSurface.withOpacity(0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      /// 🔹 Bottom Fade
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.deepSurface.withOpacity(0),
                                AppColors.deepSurface,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                /// 🔹 Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      bloc.add(NextStepEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
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
}
