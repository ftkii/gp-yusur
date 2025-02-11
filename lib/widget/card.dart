import 'package:flutter/material.dart';

class Card_ra extends StatelessWidget {
  const Card_ra({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Remember Allah"),
            SizedBox(
              height: 10,
            ),
            Text(
              " Allah, send blessings and peace upon our Prophet Muhammad.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffffD9D9D9),
          width: 1,
        ),
        color: Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
