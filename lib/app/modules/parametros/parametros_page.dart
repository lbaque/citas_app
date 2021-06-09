import 'package:citas_app/app/data/model/ParametrosModel.dart';
import 'package:citas_app/app/modules/parametros/parametros_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParametrosPage extends StatefulWidget {
  ParametrosPage({Key key}) : super(key: key);

  @override
  _ParametrosPageState createState() => _ParametrosPageState();
}

class _ParametrosPageState extends State<ParametrosPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    final arguments = Get.arguments;

    return GetBuilder<ParametrosController>(
      id: "parametros_page",
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Parametros"),
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
                    final ParametrosModel parametros = _.parametros[i];
                    return ListTile(
                      leading: new CircleAvatar(
                          radius: 18,
                          //backgroundImage: AssetImage("assets/images/profile.jpg"),
                          //backgroundColor: Colors.transparent,
                          backgroundColor: colorapp,
                          child: Text(
                            parametros.valor[0],
                            style: TextStyle(color: Colors.white),
                          )),
                      title:
                          new Text(parametros.codigo + " " + parametros.tipo),
                      subtitle: new Text(parametros.valor),
                    );
                  },
                  itemCount: _.parametros.length,
                )
              ]),
            )),
      ),
    );
  }
}
