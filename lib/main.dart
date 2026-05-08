import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/core/constant/colors.dart';
import 'package:learning_app/presentation/screens/landing_screen/bloc/landing_screen_bloc.dart';
import 'package:learning_app/presentation/screens/landing_screen/landing_screen.dart';
import 'package:learning_app/presentation/screens/onboarding/bloc/onboarding_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // ðŸ”¥ Base design size (Figma)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LandingBloc()),
            BlocProvider(create: (_) => OnboardingBloc()), // ðŸ‘ˆ important
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Learning App',

            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.deepPurple,
              ),
            ),

            home: child,
          ),
        );
      },

      /// ðŸ‘‡ the first screen
      child: const LandingScreen(),
    );
  }
}
