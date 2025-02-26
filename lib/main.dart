import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yusur_app/Screens/Home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yusur_app/widget/PilgrimProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //يتأكد انه تمت عمليه الانشلايز قبل مايسوي رن
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(create: (_) => PilgrimProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
