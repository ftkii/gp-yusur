import 'package:flutter/material.dart';
import 'package:yusur_app/widget/Pligrim_info.dart';
import 'package:yusur_app/widget/arrow.dart';

class PilgrimInformation extends StatefulWidget {
  const PilgrimInformation({super.key});

  @override
  State<PilgrimInformation> createState() => _PilgrimInformationState();
}

class _PilgrimInformationState extends State<PilgrimInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Pligrim Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16, top: 16),
            child: ArrowIcon(),
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(
          height: 70,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 40, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Text(
              "Username",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // تصميم البطاقة الخاصة بمعلومات الحاج
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfff666059), width: 0.5),
                  color: Color(0xfffD1CCC4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    pligrim_info(text: "National ID / Iqama ID: 987654321"),
                    pligrim_info(text: "Campaign: ------ Group"),
                    pligrim_info(text: "Mobile Number: 0556873456"),
                    pligrim_info(text: "Blood Type: O+"),
                    pligrim_info(text: "Country: Germany"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
