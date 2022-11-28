import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class AnotherTxtDetailsTwoWidget extends StatefulWidget {
  const AnotherTxtDetailsTwoWidget({super.key});

  @override
  State<AnotherTxtDetailsTwoWidget> createState() =>
      _AnotherTxtDetailsTwoWidgetState();
}

class _AnotherTxtDetailsTwoWidgetState
    extends State<AnotherTxtDetailsTwoWidget> {
  String datesunrise = DateFormat("yMMMd").format(DateTime.now());
  String datesunset = DateFormat("yMMMd").format(DateTime.now());
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
      datesunrise = DateFormat("h:mm a").format(w.sunrise!);
      datesunset = DateFormat("h:mm a").format(w.sunset!);
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
                datesunrise,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                datesunset,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
