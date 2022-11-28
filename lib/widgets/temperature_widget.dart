import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapk/widgets/customs_color.dart';
import '../controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  String icontext = "10d";
  double temp = 0.0;
  String tempTxt = "";
  String stateTxt = "";
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
      icontext = w.weatherIcon!;
      temp = w.temperature!.celsius!;
      tempTxt = temp.round().toString();
      stateTxt = w.weatherMain!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Image.network(
        "https://openweathermap.org/img/wn/${icontext}@2x.png",
        height: 110,
        width: 110,
      ),
      Container(
        height: 100,
        width: 1,
        color: CustomColors.dividerline,
      ),
      Container(
          padding: const EdgeInsets.only(right: 20),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Text("${tempTxt}°",
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.grey[70],
                          height: 1.5,
                          fontWeight: FontWeight.w600)),
                  Text("C",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.grey[70],
                          height: 1.5,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(stateTxt,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[70],
                        height: 0.5,
                        fontWeight: FontWeight.w100)),
              ])
            ],
          )),
    ]);
  }
}
