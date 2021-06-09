import 'package:citas_app/app/modules/parametros/parametros_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateParametrosPage extends StatefulWidget {
  CreateParametrosPage({Key key}) : super(key: key);

  @override
  _CreateParametrosPageState createState() => _CreateParametrosPageState();
}

class _CreateParametrosPageState extends State<CreateParametrosPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<ParametrosController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Parametros"),
          backgroundColor: colorapp,
          elevation: 0.0,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(children: <Widget>[]),
        ),
      ),
    );
  }
}
