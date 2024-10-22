import 'package:nrtk/config/style.dart';
import 'package:nrtk/widgets/TWebView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});
  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFFD3D9D5),
        body: SafeArea(
          bottom: false,
          child: Container(
            height: Adaptive.h(100),
            color: kWhiteBgColor,
            child: const TWebView(),
          ),
        ),
      ),
    );
  }
}
