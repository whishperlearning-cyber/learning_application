import 'package:flutter/material.dart';
import 'package:learning_app/presentation/widgets/app_text.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: AppText("Info Screen")));
  }
}
