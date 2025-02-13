import 'package:flutter/material.dart';
import 'campaign_schedule.dart';
import 'add_news.dart';
import 'package:hijri/hijri_calendar.dart';

class CampaignNews extends StatefulWidget {
  const CampaignNews({super.key});

  @override
  State<CampaignNews> createState() => _CampaignNewsState();
}

String toOrdinal(int number) => (number >= 11 && number <= 13)
    ? '${number}th'
    : (number % 10 == 1)
        ? '${number}st'
        : (number % 10 == 2)
            ? '${number}nd'
            : (number % 10 == 3)
                ? '${number}rd'
                : '${number}th';

class _CampaignNewsState extends State<CampaignNews> {
  var hijriDate = HijriCalendar.fromDate(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(51, 154, 145, 133),
          title: Center(
            child: Text(
              "Campaign News",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          )),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 367,
                    margin: EdgeInsets.fromLTRB(12, 60, 12, 1),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                            color: Color.fromARGB(128, 154, 145, 133),
                            width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => campaignSchedule()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/schedule.png",
                                  height: 25,
                                  width: 25,
                                ),
                                Text(
                                  "Schedule",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                "images/news.png",
                                height: 25,
                                width: 25,
                              ),
                              Text(
                                "News",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Color.fromARGB(255, 102, 96, 89),
                                    decorationThickness: 2),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 51,
                    width: 307,
                    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                    padding: EdgeInsets.only(left: 35, right: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(59),
                        border: Border.all(
                            color: Color.fromARGB(128, 154, 145, 133),
                            width: 2)),
                    child: Row(
                      children: [
                        Image(image: AssetImage("assets/LeftArrow.png")),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${toOrdinal(HijriCalendar.fromDate(DateTime.now()).hDay)} of ${HijriCalendar.fromDate(DateTime.now()).longMonthName}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 400,
                    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                    padding: EdgeInsets.only(left: 35, right: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(59),
                        border: Border.all(
                            color: Color.fromARGB(128, 154, 145, 133),
                            width: 2)),
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ]),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 183, 173, 159),
                  fixedSize: Size(60, 60),
                  padding: EdgeInsets.all(3),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Addnewpage(),
                      ));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 35,
                )),
          ),
        ],
      ))),
    );
  }
}
