import 'package:citas_app/app/modules/cites/cites_controller.dart';
import 'package:citas_app/app/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteCitesPage extends StatelessWidget {
  const DeleteCitesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);

    return GetBuilder<CitesController>(
        builder: (_) => Scaffold(
              body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                    width: size.width,
                    height: size.height,
                  )),
            ));
  }
}
