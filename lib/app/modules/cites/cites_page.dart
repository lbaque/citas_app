import 'package:citas_app/app/data/model/CitasModel.dart';
import 'package:citas_app/app/modules/cites/cites_controller.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CitesPage extends StatefulWidget {
  CitesPage({Key key}) : super(key: key);

  @override
  _CitesPageState createState() => _CitesPageState();
}

class _CitesPageState extends State<CitesPage> {
  TextEditingController dateTextEdit = TextEditingController()
    ..text = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<CitesController>(
        id: "citas_page",
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Historial"),
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
                    padding: EdgeInsets.symmetric(horizontal: responsive.ip(2)),
                    child: Stack(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: size.width,
                            child: TextField(
                              controller: dateTextEdit,
                              keyboardType: TextInputType.text,
                              decoration: textInputDecoration.copyWith(
                                  icon: const Icon(Icons.calendar_today),
                                  labelText: 'Fecha'),
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2023),
                                ).then((x) {
                                  var fecha =
                                      DateFormat('dd/MM/yyyy').format(x);
                                  dateTextEdit.text = fecha;

                                  _.onDateChangedSearch(fecha);
                                });
                              },
                              onChanged: (val) => _.onDateChanged(val),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (c, i) {
                                final CitasModel cita = _.citas[i];
                                if (cita.estado == "Confirmado") {
                                  return Slidable(
                                      key: ValueKey(i),
                                      actionPane: SlidableDrawerActionPane(),
                                      secondaryActions: <Widget>[
                                        IconSlideAction(
                                          color: colorapp,
                                          icon: Icons.edit,
                                          closeOnTap: false,
                                          onTap: () {
                                            Get.toNamed(AppRoutes.CITESEdit,
                                                arguments: {'tipo': cita});
                                          },
                                        ),
                                        IconSlideAction(
                                          color: colorapp,
                                          icon: Icons.close,
                                          closeOnTap: true,
                                          onTap: () {
                                            _.cancelarItem(i);
                                          },
                                        )
                                      ],
                                      dismissal: SlidableDismissal(
                                          child: SlidableDrawerDismissal()),
                                      child: ListTile(
                                        leading: new CircleAvatar(
                                            radius: 18,
                                            //backgroundImage: AssetImage("assets/images/profile.jpg"),
                                            //backgroundColor: Colors.transparent,
                                            backgroundColor: colorapp,
                                            child: Text(
                                              cita.name[0],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        title: new Text(cita.name +
                                            " " +
                                            cita.lastname +
                                            "" +
                                            cita.timetable +
                                            " " +
                                            cita.date),
                                        subtitle: new Text(cita.observacion +
                                            " Estado: " +
                                            cita.estado),
                                      ));
                                } else {
                                  return Slidable(
                                      key: ValueKey(i),
                                      actionPane: SlidableDrawerActionPane(),
                                      secondaryActions: <Widget>[
                                        IconSlideAction(
                                          color: colorapp,
                                          icon: Icons.edit,
                                          closeOnTap: false,
                                          onTap: () {
                                            Get.toNamed(AppRoutes.CITESEdit,
                                                arguments: {'tipo': cita});
                                          },
                                        ),
                                        IconSlideAction(
                                          color: colorapp,
                                          icon: Icons.check,
                                          closeOnTap: true,
                                          onTap: () {
                                            _.confirmarItem(i);
                                          },
                                        )
                                      ],
                                      dismissal: SlidableDismissal(
                                          child: SlidableDrawerDismissal()),
                                      child: ListTile(
                                        leading: new CircleAvatar(
                                            radius: 18,
                                            //backgroundImage: AssetImage("assets/images/profile.jpg"),
                                            //backgroundColor: Colors.transparent,
                                            backgroundColor: colorapp,
                                            child: Text(
                                              cita.name[0],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        title: new Text(cita.name +
                                            " " +
                                            cita.lastname +
                                            "" +
                                            cita.timetable +
                                            " " +
                                            cita.date),
                                        subtitle: new Text(cita.observacion +
                                            " Estado: " +
                                            cita.estado),
                                      ));
                                }
                              },
                              itemCount: _.citas.length,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  )),
            ));
  }
}
