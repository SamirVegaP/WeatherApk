import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapk/widgets/customs_color.dart';
import '../controller/global_controller.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ConfortWidget extends StatefulWidget {
  const ConfortWidget({super.key});

  @override
  State<ConfortWidget> createState() => _ConfortWidgetState();
}

class _ConfortWidgetState extends State<ConfortWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  double valuer = 0.0;
  int fl = 0;
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
      valuer = w.humidity!;
      fl = w.tempFeelsLike!.celsius!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
          child: Text("Nivel de Confort",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w200)),
        ),
        SizedBox(
            height: 180,
            child: Column(
              children: [
                Center(
                    child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: valuer,
                  appearance: CircularSliderAppearance(
                      infoProperties: InfoProperties(
                        bottomLabelText: "Humedad",
                        bottomLabelStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      animationEnabled: true,
                      size: 140,
                      customColors: CustomSliderColors(
                          trackColor:
                              CustomColors.firstGradientColor.withAlpha(100),
                          hideShadow: true,
                          progressBarColors: [
                            CustomColors.cardColor,
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(
                            text: "Sensación de Temperatura: ",
                            style: TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: CustomColors.textColorBlack,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: "${fl}°",
                            style: const TextStyle(
                                fontSize: 14,
                                height: 0.8,
                                color: CustomColors.textColorBlack,
                                fontWeight: FontWeight.w400)),
                        const TextSpan(
                            text: "C",
                            style: TextStyle(
                                fontSize: 9,
                                height: 0.8,
                                color: CustomColors.textColorBlack,
                                fontWeight: FontWeight.w600))
                      ]),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
