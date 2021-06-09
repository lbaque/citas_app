import 'package:citas_app/app/modules/information/information_controller.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/design_course_app_theme.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;

    return GetBuilder<InformationController>(
        builder: (_) => Scaffold(
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: DesignCourseAppTheme.nearlyWhite,
                  child: Stack(children: <Widget>[
                    Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.2,
                          child: Image.asset('assets/logo.png'),
                        ),
                      ],
                    ),
                    Positioned(
                      top: (size.width / 1.2) - 24.0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: DesignCourseAppTheme.nearlyWhite,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color:
                                    DesignCourseAppTheme.grey.withOpacity(0.2),
                                offset: const Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SingleChildScrollView(
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight: infoHeight,
                                    maxHeight: tempHeight > infoHeight
                                        ? tempHeight
                                        : infoHeight),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 32.0, left: 18, right: 16),
                                        child: Text(
                                          'Horarios de atención',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                            letterSpacing: 0.27,
                                            color:
                                                DesignCourseAppTheme.darkerText,
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        opacity: opacity1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              getTimeBoxUI('Lunes', 'Viernes'),
                                              getTimeBoxUI('8:00 am - 12 pm',
                                                  '14:00 am - 16 pm'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        opacity: opacity1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: <Widget>[
                                              getTimeBoxUI('Sabado', ''),
                                              getTimeBoxUI(
                                                  '8:00 am - 12 pm', ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AnimatedOpacity(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          opacity: opacity2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 8,
                                                bottom: 8),
                                            child: Text(
                                              'Consultorio Odontológico A.C. ubicado en el Cantón 24 de Mayo, calle Comercio y Eloy Alfaro Sucre, Ecuador',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14,
                                                letterSpacing: 0.27,
                                                color:
                                                    DesignCourseAppTheme.grey,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        opacity: opacity3,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, bottom: 16, right: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              CupertinoButton(
                                                color: Color.fromRGBO(
                                                    252, 34, 193, 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                onPressed: () => launch(
                                                    'https://www.youtube.com'),
                                                child: Text("Ver video",
                                                    style: TextStyle(
                                                        fontSize: responsive
                                                            .ip(2.5))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context)
                                            .padding
                                            .bottom,
                                      )
                                    ]),
                              ),
                            )),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        child: SafeArea(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[])),
                      ),
                    ),
                  ]),
                ),
              ),
            ));
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: DesignCourseAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: colorapp,
                ),
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: DesignCourseAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
