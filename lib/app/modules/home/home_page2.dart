import 'package:citas_app/app/modules/home/home_controller.dart';
import 'package:citas_app/app/routes/app_routes.dart';
import 'package:citas_app/app/utils/constant.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),

                    /*Text(
                      "\$ ${post["price"]}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )*/
                  ],
                ),
                Image.asset(
                  "assets/app/${post["image"]}",
                  width: 50,
                  height: 50,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();

    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  ListView listView = ListView(
    children: <Widget>[
      new ListTile(
        leading: new Icon(Icons.home),
        title: new Text("Principal"),
      ),
      new ListTile(
        leading: new Icon(Icons.person_add_rounded),
        title: new Text("Pacientes"),
        onTap: () =>
            Get.toNamed(AppRoutes.ENTIDAD, arguments: {'tipo': 'Paciente'}),
      ),
      new ListTile(
        leading: new Icon(Icons.calendar_today),
        title: new Text("Registrar Cita"),
        onTap: () => Get.toNamed(AppRoutes.CITESCreate),
      ),
      new ListTile(
        leading: new Icon(Icons.search),
        title: new Text("Consultar Cita"),
        onTap: () => Get.toNamed(AppRoutes.CITES),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Incio'),
          backgroundColor: colorapp,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _.signOut();
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        drawer: new Drawer(
          child: listView,
        ),
        body: Container(
          height: size.height,
          child: Column(children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: responsive.ip(2)),
                  color: colorapp,
                  borderRadius: BorderRadius.circular(4),
                  onPressed: () => Get.toNamed(AppRoutes.CITESCreate),
                  child:
                      Text("+", style: TextStyle(fontSize: responsive.ip(2.5))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      if (topContainer > 0.5) {
                        scale = index + 0.5 - topContainer;
                        if (scale < 0) {
                          scale = 0;
                        } else if (scale > 1) {
                          scale = 1;
                        }
                      }
                      return Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.7,
                              alignment: Alignment.topCenter,
                              child: itemsData[index]),
                        ),
                      );
                    })),
          ]),
        ),
      ),
    );
  }
}
