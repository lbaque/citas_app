import 'package:citas_app/app/global_widgets/circule.dart';
import 'package:citas_app/app/modules/account/account_controller.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

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
                  colors: [colorapp, Colors.purple],
                ),
              ),
              Positioned(
                left: -size.width * 0.15,
                top: -size.width * 0.34,
                child: Circle(
                  radius: size.width * 0.35,
                  colors: [colorapp, Colors.purple],
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
                                width: responsive.wp(20),
                                height: responsive.wp(20),
                                margin: EdgeInsets.only(top: size.width * 0.3),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/register.png'),
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26, blurRadius: 25)
                                    ]),
                              ),
                              SizedBox(height: responsive.hp(4)),
                              Text(
                                "Bienvenido \n Registre sus datos",
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
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(Icons.person),
                                                labelText: 'Nombres'),
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onNameChanged(val),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(Icons.person),
                                                labelText: 'Apellidos'),
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onLastNameChanged(val),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(
                                                    Icons.format_list_numbered),
                                                labelText: 'Cedula'),
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) => _.onDNIChanged(val),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(
                                                    Icons.verified_user_sharp),
                                                labelText: 'Usuario'),
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onUserNameChanged(val),
                                      ),
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
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onEmailChanged(val),
                                      ),
                                      TextFormField(
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(Icons.lock),
                                                labelText: 'Contraseña'),
                                        obscureText: true,
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onPasswordChanged(val),
                                      ),
                                      TextFormField(
                                        decoration:
                                            textInputDecoration.copyWith(
                                                icon: const Icon(Icons.lock),
                                                labelText:
                                                    'Confirmar contraseña'),
                                        obscureText: true,
                                        validator: (val) {
                                          return val.isEmpty
                                              ? 'Dato obligatorio'
                                              : null;
                                        },
                                        onChanged: (val) =>
                                            _.onPasswordConfirmChanged(val),
                                      ),
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
                                  color: colorapp,
                                  borderRadius: BorderRadius.circular(4),
                                  onPressed: () => _.onRegister(),
                                  child: Text("Registrar",
                                      style: TextStyle(
                                          fontSize: responsive.ip(2.5))),
                                ),
                              ),
                              SizedBox(height: responsive.hp(2)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("¿Ya tienes cuenta?",
                                      style: TextStyle(
                                          fontSize: responsive.ip(1.8),
                                          color: Colors.black54)),
                                  CupertinoButton(
                                    onPressed: () {
                                      Get.offNamed(AppRoutes.LOGIN);
                                    },
                                    child: Text("Ingresar",
                                        style: TextStyle(
                                            fontSize: responsive.ip(1.8),
                                            color: Colors.pinkAccent)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
