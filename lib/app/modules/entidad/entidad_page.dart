import 'package:citas_app/app/data/model/EntidadModel.dart';
import 'package:citas_app/app/modules/entidad/entidad_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntidadPage extends StatefulWidget {
  EntidadPage({Key key}) : super(key: key);

  @override
  _EntidadPageState createState() => _EntidadPageState();
}

class _EntidadPageState extends State<EntidadPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    final arguments = Get.arguments;

    return GetBuilder<EntidadController>(
      id: "entidad_page",
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(arguments['tipo']),
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
                ListView.builder(
                  itemBuilder: (c, i) {
                    final EntidadModel entidad = _.entidad[i];
                    return ListTile(
                      leading: new CircleAvatar(
                          radius: 18,
                          //backgroundImage: AssetImage("assets/images/profile.jpg"),
                          //backgroundColor: Colors.transparent,
                          backgroundColor: colorapp,
                          child: Text(
                            entidad.nombres[0],
                            style: TextStyle(color: Colors.white),
                          )),
                      title:
                          new Text(entidad.nombres + " " + entidad.apellidos),
                      subtitle: new Text(
                          entidad.direccion + " " + entidad.identificcion),
                    );
                  },
                  itemCount: _.entidad.length,
                )
              ]),
            )),
      ),
    );
  }
}
