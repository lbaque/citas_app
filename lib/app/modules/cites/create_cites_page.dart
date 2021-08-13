import 'package:citas_app/app/modules/cites/cites_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateCitesPage extends StatefulWidget {
  const CreateCitesPage({Key key}) : super(key: key);

  @override
  _CreateCitesPageState createState() => _CreateCitesPageState();
}

class _CreateCitesPageState extends State<CreateCitesPage> {
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

    return GetBuilder<CitesController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Crear'),
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
                                            minWidth: size.width,
                                          ),
                                          child: Form(
                                            child: Column(
                                              children: <Widget>[
                                                TextFormField(
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
                                                  onChanged: (val) =>
                                                      _.onNameChanged(val),
                                                ),
                                                TextFormField(
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
                                                  onChanged: (val) =>
                                                      _.onLastNameChanged(val),
                                                ),
                                                TextFormField(
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
                                                  onChanged: (val) =>
                                                      _.onDNIChanged(val),
                                                ),
                                                TextFormField(
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
                                                  onChanged: (val) =>
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
                                                      var fecha = DateFormat(
                                                              'dd/MM/yyyy')
                                                          .format(x);
                                                      dateTextEdit.text = fecha;
                                                      _.onDateChanged(fecha);
                                                    });
                                                  },
                                                  onChanged: (val) =>
                                                      _.onDateChanged(val),
                                                ),
                                                DropdownButtonFormField(
                                                  hint: Text("Horario"),
                                                  decoration: InputDecoration(
                                                      icon: const Icon(
                                                          Icons.timer)),
                                                  onChanged: (x) {
                                                    _.ontimetableChanged(x);
                                                    setState(
                                                        () => {valuex = x});
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
                                            onPressed: () => _.onRegister(),
                                            child: Text("Crear",
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
