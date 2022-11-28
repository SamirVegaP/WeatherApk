import 'package:flutter/material.dart';
import 'package:weatherapk/widgets/customs_color.dart';

class AnotherDetailsWidget extends StatefulWidget {
  const AnotherDetailsWidget({super.key});

  @override
  State<AnotherDetailsWidget> createState() => _AnotherDetailsWidgetState();
}

class _AnotherDetailsWidgetState extends State<AnotherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.only(top: 12)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                "https://img.icons8.com/fluency/512/sunrise.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                "https://img.icons8.com/fluency/512/sunset.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }
}
