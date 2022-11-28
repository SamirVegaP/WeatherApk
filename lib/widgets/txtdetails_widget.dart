import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapk/widgets/customs_color.dart';
import '../controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class TxtDetailsWidget extends StatefulWidget {
  const TxtDetailsWidget({super.key});

  @override
  State<TxtDetailsWidget> createState() => _TxtDetailsWidgetState();
}

class _TxtDetailsWidgetState extends State<TxtDetailsWidget> {
  String winds = "";
  String clouds = "";
  String hygro = "";
  String someone = "";
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    getAddress();
    super.initState();
  }

  getAddress() async {
    WeatherFactory wf = WeatherFactory("fbe4f636d052c6acacb97519f02e3b99",
        language: Language.SPANISH);
    Weather w = await wf.currentWeatherByLocation(
        globalController.getLatitude().value,
        globalController.getlongitude().value);
    setState(() {
      winds = w.windSpeed.toString();
      clouds = w.cloudiness.toString();
      hygro = w.humidity.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                "${winds} km/h",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                "${clouds}%",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                "${hygro} %",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )
      ],
    );
  }
}
