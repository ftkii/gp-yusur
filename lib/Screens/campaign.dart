import 'package:flutter/material.dart';
import 'package:yusur_app/Screens/campaign_schedule.dart';
import 'package:yusur_app/widget/contain.dart';
import 'campaign_news_page.dart';

class Campaign extends StatelessWidget {
  const Campaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Campaign Name",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        )),
        backgroundColor: const Color.fromARGB(51, 154, 145, 133),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          campaignSchedule()));
                            },
                            child: contain(
                              imagePath: 'images/schedule.png',
                              imageName: 'Campaign Schedule',
                            ),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CampaignNews()));
                            },
                            child: contain(
                              imagePath: 'images/news.png',
                              imageName: 'Campaign News',
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          contain(
                            imagePath: 'assets/AlarmBracelet.png',
                            imageName: 'Recive Location',
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          contain(
                            imagePath: 'images/news2.png',
                            imageName: 'List Pilgrim',
                          )
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
