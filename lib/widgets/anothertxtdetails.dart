import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapk/widgets/customs_color.dart';
import '../controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class AnotherTxtDetailsOneWidget extends StatefulWidget {
  const AnotherTxtDetailsOneWidget({super.key});

  @override
  State<AnotherTxtDetailsOneWidget> createState() =>
      _AnotherTxtDetailsOneWidgetState();
}

class _AnotherTxtDetailsOneWidgetState
    extends State<AnotherTxtDetailsOneWidget> {
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
                "Amanecer",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 70,
              child: Text(
                "Atardecer",
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
