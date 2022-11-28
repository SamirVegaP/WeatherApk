import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "Hola Mundo";
  String date = DateFormat("yMMMd").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  getAddress() async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        globalController.getLatitude().value,
        globalController.getlongitude().value);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topCenter,
          child: Text(city, style: const TextStyle(fontSize: 35, height: 2)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(date,
              style:
                  TextStyle(fontSize: 14, color: Colors.grey[70], height: 1.5)),
        ),
      ],
    );
  }
}
