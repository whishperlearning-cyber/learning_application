import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_event.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.h),

          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  blurRadius: 24.r,
                  offset: Offset(0, 12.h),
                ),
              ],
            ),
            padding: EdgeInsets.all(18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Start with your phone number',
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.65),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),

                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkSurface,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.white.withOpacity(0.1)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      /// 🌍 Country Code
                      Row(
                        children: [
                          Text(
                            "+91",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.white.withOpacity(0.6),
                            size: 18.sp,
                          ),
                        ],
                      ),

                      SizedBox(width: 10.w),

                      /// 🔹 Divider
                      Container(
                        height: 25.h,
                        width: 1.w,
                        color: AppColors.white.withOpacity(0.15),
                      ),

                      SizedBox(width: 10.w),

                      /// 📱 Input Field
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Phone number",
                            hintStyle: TextStyle(
                              color: AppColors.white.withOpacity(0.4),
                              fontSize: 14.sp,
                            ),
                            border: InputBorder.none,
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  height: 51.h,
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
