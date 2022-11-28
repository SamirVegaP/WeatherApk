import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapk/controller/global_controller.dart';
import 'package:weatherapk/widgets/anothertxtdetails.dart';
import 'package:weatherapk/widgets/confort_level.dart';
import 'package:weatherapk/widgets/header_widget.dart';
import 'package:weatherapk/widgets/moredetails_widget.dart';
import 'package:weatherapk/widgets/moredetails_widget2.dart';
import 'package:weatherapk/widgets/otheranothertxt.dart';
import 'package:weatherapk/widgets/temperature_widget.dart';
import 'package:weatherapk/widgets/txtdetails_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Llamado
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/552/552448.png",
                  height: 200,
                  width: 200,
                ),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    HeaderWidget(),
                    TemperatureWidget(),
                    MoreDetailsWidget(),
                    TxtDetailsWidget(),
                    AnotherDetailsWidget(),
                    AnotherTxtDetailsOneWidget(),
                    AnotherTxtDetailsTwoWidget(),
                    ConfortWidget()
                  ],
                ),
              )),
      ),
    );
  }
}
