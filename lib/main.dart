import 'package:flutter/material.dart';
//import 'package:projct_gp/Screens/schedulecampaign.dart';
import 'package:projct_gp/Screens/campaign_news.dart';
//import 'Screens/support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: campaign_news());
  }
}
