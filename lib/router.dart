import 'package:nrtk/views/approot.dart';
import 'package:nrtk/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class FRouter {
  static final FluroRouter router = FluroRouter();

  static final Handler _rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => const AppRoot(),
  );

  static final Handler _splashHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => const SplashScreen(),
  );

  static void setupRouter() {
    router.define('/home', handler: _rootHandler);
    router.define('/', handler: _splashHandler);
  }
}
