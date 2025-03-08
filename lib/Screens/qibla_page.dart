import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:yusur_app/widget/InfoBottomSheet.dart';
import 'package:yusur_app/widget/arrow.dart';

class QiblaCompassScreen extends StatefulWidget {
  const QiblaCompassScreen({super.key});

  @override
  QiblaCompassScreenState createState() => QiblaCompassScreenState();
}

class QiblaCompassScreenState extends State<QiblaCompassScreen> {
  MagnetometerEvent _magnetometerEvent = MagnetometerEvent(
    0,
    0,
    0,
    DateTime.now(),
  );
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription = magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _magnetometerEvent = event;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  double calculateDegrees(double x, double y) {
    double heading = atan2(y, x);
    heading = heading * (180.0 / pi);
    if (heading < 0) {
      heading -= 360.0;
    }
    return heading * -1;
  }

  @override
  Widget build(BuildContext context) {
    final degrees = calculateDegrees(
      _magnetometerEvent.x,
      _magnetometerEvent.y,
    );
    final angle = -1 * pi / 180 * degrees;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Qibla Direction",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16, top: 16),
            child: ArrowIcon(),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffffD9D9D9), width: 0.5),
              color: Color.fromARGB(255, 241, 238, 238),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.info_outline, color: Colors.black),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder:
                      (context) => const InfoBottomSheet(
                        description:
                            "1. Hold your phone flat and steady in your hand. \n"
                            "2. Make sure to avoid any magnetic interference.\n"
                            "3. Follow the pointer until it aligns with the Kaaba icon.\n"
                            "4. The displayed angle (e.g., 294) indicates the Qibla direction.\n",
                      ),
                );
              },
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${degrees.toStringAsFixed(0)}°',
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: angle,

                  child: Image.asset(
                    'images/qibla.jpg',
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
