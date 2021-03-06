import 'package:citas_app/app/modules/authenticate/authenticate_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticatePage extends StatelessWidget {
  const AuthenticatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticateController>(
      builder: (_) => Scaffold(),
    );
  }
}
