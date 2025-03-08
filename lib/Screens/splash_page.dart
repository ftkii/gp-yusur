import 'package:flutter/material.dart';
import 'package:yusur_app/Screens/Home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // تأخير لمدة 3 ثوانٍ ثم الانتقال إلى الصفحة الأخرى
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 320),
          Image.asset("images/yusur_logo.png", width: 150, height: 150),
        ],
      ),
    );
  }
}
