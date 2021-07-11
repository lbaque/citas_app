import 'package:citas_app/app/global_widgets/circule.dart';
import 'package:citas_app/app/modules/account/account_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<AccountController>(
      builder: (_) => Scaffold(
          body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: -size.width * 0.22,
                  top: -size.width * 0.36,
                  child: Circle(
                    radius: size.width * 0.45,
                    colors: [Color.fromRGBO(252, 34, 193, 1), Colors.purple],
                  ),
                ),
                Positioned(
                  left: -size.width * 0.15,
                  top: -size.width * 0.34,
                  child: Circle(
                    radius: size.width * 0.35,
                    colors: [Color.fromRGBO(252, 34, 193, 1), Colors.purple],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: responsive.ip(2)),
                    child: SafeArea(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: responsive.wp(40),
                                  height: responsive.wp(40),
                                  margin:
                                      EdgeInsets.only(top: size.width * 0.3),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/logo.png'),
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 25)
                                      ]),
                                ),
                                SizedBox(height: responsive.hp(4)),
                                Text(
                                  "Ingrese su correo electrónico",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: responsive.ip(2),
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 350,
                                    minWidth: 350,
                                  ),
                                  child: Form(
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration:
                                              textInputDecoration.copyWith(
                                                  icon: const Icon(Icons.email),
                                                  labelText:
                                                      'Correo electrónico'),
                                          validator: (val) {
                                            return val.isEmpty
                                                ? 'Ingrese un correo electrónico'
                                                : null;
                                          },
                                          onChanged: (val) => _
                                              .onEmailResetPasswordChanged(val),
                                        ),
                                        SizedBox(height: responsive.hp(3)),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: responsive.hp(4)),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 350,
                                    minWidth: 350,
                                  ),
                                  child: CupertinoButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: responsive.ip(2)),
                                    color: Color.fromRGBO(252, 34, 193, 1),
                                    borderRadius: BorderRadius.circular(4),
                                    onPressed: () => _.onResetPassword(),
                                    child: Text("Reestablecer",
                                        style: TextStyle(
                                            fontSize: responsive.ip(2.5))),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                )
              ],
            )),
      )),
    );
  }
}
