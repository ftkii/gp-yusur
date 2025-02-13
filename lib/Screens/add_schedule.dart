import 'package:flutter/material.dart';
import 'campaign_schedule.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(51, 154, 145, 133),
        title: Center(
          child: Text(
            "Insert Schedule",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "images/schedule.png",
              height: 83,
              width: 79,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(204, 183, 173, 159),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(61),
                      topRight: Radius.circular(61)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 211,
                      width: 357,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromARGB(255, 154, 145, 133),
                              width: 1)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter the schedule details here.',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 67,
                      width: 357,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Color.fromARGB(255, 154, 145, 133),
                              width: 1)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Date',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18)),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 175, 165, 152),
                          fixedSize: Size(357, 60)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => campaignSchedule()));
                      },
                      child: Text(
                        "Publish",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
