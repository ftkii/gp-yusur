import 'package:flutter/material.dart';
import 'sign_in_verify.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(51, 154, 145, 133),
        title: Center(
          child: Text(
            "Sign in",
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
              "assets/CampaignSchedule.png",
              height: 83,
              width: 79,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Log in now to access exclusive features and manage your campaign effortlessly and efficiently.",
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 357,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color.fromARGB(255, 154, 145, 133),
                            width: 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Campaign Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 357,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color.fromARGB(255, 154, 145, 133),
                            width: 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Admin Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 357,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color.fromARGB(255, 154, 145, 133),
                            width: 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 357,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color.fromARGB(255, 154, 145, 133),
                            width: 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 357,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Color.fromARGB(255, 154, 145, 133),
                            width: 1)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 175, 165, 152),
                        fixedSize: Size(357, 60)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInVerify()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
