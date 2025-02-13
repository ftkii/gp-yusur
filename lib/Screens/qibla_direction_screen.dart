import 'package:flutter/material.dart';


class QiblaDirectionScreen extends StatelessWidget {
  const QiblaDirectionScreen({super.key});

  final double qiblaAngle = 0; // زاوية القبلة (يمكن تعديلها لاحقًا)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر المعلومات (i)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const Icon(Icons.info_outline, size: 28),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (context) => const InfoBottomSheet(),
                    );
                  },
                ),
              ),
            ),

            const Spacer(),

            // العنوان
            const Text(
              "Qibla Direction",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // المنطقة
            const Text(
              "-- Region",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 10),

            // زاوية القبلة
            Text(
              "$qiblaAngle°",
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // دائرة فارغة للقبلة
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2), 
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

//  (Bottom Sheet)
class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // أيقونة الهاتف
            Image.asset(
            'images/phone.png',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
              const SizedBox(height: 10),

              // عنوان "How to use"
              const Text(
                "How to use",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // التعليمات
              const Text(
                "1. Hold your phone flat and steady in your hand.\n"
                "2. Make sure to avoid any magnetic interference.\n"
                "3. Follow the pointer until it aligns with the Kaaba icon.\n"
                "4. The displayed angle (e.g., 294) indicates the Qibla direction.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),

        // خط فاصل فوق الزر
        const Divider(
          thickness: 1,
          height: 1,
          color: Colors.black,
        ),

        // زر الإغلاق مثل Figma
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: const Text(
              "Close",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
