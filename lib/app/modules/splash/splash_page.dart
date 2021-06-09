import 'package:citas_app/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
