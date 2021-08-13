import 'package:citas_app/app/data/model/CitasModel.dart';
import 'package:citas_app/app/modules/cites/cites_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCitesPage extends StatefulWidget {
  EditCitesPage({Key key}) : super(key: key);

  @override
  _EditCitesPageState createState() => _EditCitesPageState();
}

class _EditCitesPageState extends State<EditCitesPage> {
  var model = Get.arguments["tipo"] as CitasModel;
  final formKey = GlobalKey<FormState>();

  TextEditingController dateTextEdit = TextEditingController();
  String valuex = "";
  List listItemsHorarios = [
    "8:00 AM",
    "8:30 AM",
    "9:00 AM",
    "9:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "14:00 PM",
    "14:30 PM",
    "15:00 PM",
    "15:30 PM",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    dateTextEdit.text = model.date;
    return GetBuilder<CitesController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Editar'),
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
                    child: Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            width: size.width,
                            child: SafeArea(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxWidth: size.width,
                                              minWidth: size.width),
                                          child: Form(
                                            key: formKey,
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
                                                  initialValue: model.name,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      textInputDecoration
                                                          .copyWith(
                                                              icon: const Icon(
                                                                  Icons.person),
                                                              labelText:
                                                                  'Nombres'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onSaved: (val) =>
                                                      _.onNameChanged(val),
                                                ),
                                                TextFormField(
                                                  initialValue: model.lastname,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration:
                                                      textInputDecoration
                                                          .copyWith(
                                                              icon: const Icon(
                                                                  Icons.person),
                                                              labelText:
                                                                  'Apellidos'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onSaved: (val) =>
                                                      _.onLastNameChanged(val),
                                                ),
                                                TextFormField(
                                                  initialValue: model.dni,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          icon: const Icon(Icons
                                                              .format_list_numbered),
                                                          labelText: 'Cedula'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onSaved: (val) =>
                                                      _.onDNIChanged(val),
                                                ),
                                                TextFormField(
                                                  initialValue: model.telefono,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          icon: const Icon(Icons
                                                              .mobile_friendly_rounded),
                                                          labelText:
                                                              'Teléfono'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onChanged: (val) =>
                                                      _.ontelefonoChanged(val),
                                                ),
                                                TextFormField(
                                                  initialValue: model.direccion,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          icon: const Icon(Icons
                                                              .home_rounded),
                                                          labelText:
                                                              'Dirección'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onChanged: (val) =>
                                                      _.ondireccionChanged(val),
                                                ),
                                                TextFormField(
                                                  initialValue:
                                                      model.observacion,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          icon: const Icon(Icons
                                                              .text_fields),
                                                          labelText:
                                                              'Observación'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  onSaved: (val) =>
                                                      _.onObservacionChanged(
                                                          val),
                                                ),
                                                TextFormField(
                                                  controller: dateTextEdit,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: textInputDecoration
                                                      .copyWith(
                                                          icon: const Icon(Icons
                                                              .calendar_today),
                                                          labelText: 'Fecha'),
                                                  validator: (val) {
                                                    return val.isEmpty
                                                        ? 'Dato obligatorio'
                                                        : null;
                                                  },
                                                  readOnly: true,
                                                  onTap: () {
                                                    showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2021),
                                                      lastDate: DateTime(2023),
                                                    ).then((x) {
                                                      String fechaArmada = x.day
                                                              .toString() +
                                                          "/" +
                                                          x.month.toString() +
                                                          "/" +
                                                          x.year.toString();
                                                      dateTextEdit.text =
                                                          fechaArmada;
                                                    });
                                                  },
                                                  onSaved: (val) =>
                                                      _.onDateChanged(val),
                                                ),
                                                DropdownButtonFormField(
                                                  value: model.timetable,
                                                  hint: Text("Horario"),
                                                  decoration: InputDecoration(
                                                      icon: const Icon(
                                                          Icons.timer)),
                                                  onChanged: (x) {
                                                    setState(
                                                        () => {valuex = x});
                                                  },
                                                  onSaved: (x) {
                                                    _.ontimetableChanged(x);
                                                  },
                                                  items: listItemsHorarios
                                                      .map((e) {
                                                    return DropdownMenuItem<
                                                            String>(
                                                        value: e.toString(),
                                                        child:
                                                            Text(e.toString()));
                                                  }).toList(),
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            onPressed: () {
                                              final isValid = formKey
                                                  .currentState
                                                  .validate();
                                              if (isValid) {
                                                _.ondocumentoChanged(model.id);
                                                _.onuserChanged(model.user);
                                                formKey.currentState.save();
                                                _.onEdit();
                                              }
                                            },
                                            child: Text("Editar",
                                                style: TextStyle(
                                                    fontSize:
                                                        responsive.ip(2.5))),
                                          ),
                                        ),
                                        SizedBox(height: responsive.hp(2)),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ));
  }
}
