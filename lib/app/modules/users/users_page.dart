import 'package:citas_app/app/data/model/UserModel.dart';
import 'package:citas_app/app/modules/users/users_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    final arguments = Get.arguments;

    return GetBuilder<UsersController>(
      id: "users_page",
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Usuarios'),
          backgroundColor: colorapp,
          elevation: 0.0,
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: size.width,
              height: size.height,
              child: Stack(children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                        width: size.width,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: textInputDecoration.copyWith(
                              icon: const Icon(Icons.search),
                              labelText: 'Buscar'),
                          onChanged: (x) {
                            String texto = x.toLowerCase();
                            _.filtroBusqueda(texto);
                          },
                        )),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (c, i) {
                          final UserModel user = _.users[i];
                          return ListTile(
                            leading: new CircleAvatar(
                                radius: 18,
                                //backgroundImage: AssetImage("assets/images/profile.jpg"),
                                //backgroundColor: Colors.transparent,
                                backgroundColor: colorapp,
                                child: Text(
                                  user.name[0],
                                  style: TextStyle(color: Colors.white),
                                )),
                            title: new Text(user.name + " " + user.lastname),
                            subtitle: new Text(user.dni +
                                " " +
                                user.email +
                                " " +
                                user.typeuser),
                          );
                        },
                        itemCount: _.users.length,
                      ),
                    )
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
