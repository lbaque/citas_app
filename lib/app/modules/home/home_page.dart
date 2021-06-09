import 'package:citas_app/app/modules/home/home_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/design_course_app_theme.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Principal'),
            backgroundColor: colorapp,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    await _.signOut();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Salir',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          drawer: new Drawer(
            elevation: 5,
            child: ListView(padding: EdgeInsets.zero, children: _.listalateral),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Container(
              width: size.width,
              height: size.height,
              color: DesignCourseAppTheme.nearlyWhite,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1.2,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
