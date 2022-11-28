import 'package:flutter/material.dart';
import 'package:weatherapk/widgets/customs_color.dart';

class MoreDetailsWidget extends StatefulWidget {
  const MoreDetailsWidget({super.key});

  @override
  State<MoreDetailsWidget> createState() => _MoreDetailsWidgetState();
}

class _MoreDetailsWidgetState extends State<MoreDetailsWidget> {
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
                "https://img.icons8.com/fluency/512/wind.png",
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
                "https://img.icons8.com/fluency/512/clouds.png",
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
                "https://img.icons8.com/fluency/512/hygrometer.png",
                fit: BoxFit.cover,
              ),
            )
          ],
        )
      ],
    );
  }
}
