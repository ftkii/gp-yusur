import 'package:flutter/material.dart';
import 'create_incident_screen.dart';

class CurrentIncidentScreen extends StatefulWidget {
  final bool hasIncident;

  const CurrentIncidentScreen({super.key, required this.hasIncident});

  @override
  _CurrentIncidentScreenState createState() => _CurrentIncidentScreenState();
}

class _CurrentIncidentScreenState extends State<CurrentIncidentScreen> {
  late bool hasIncident;

  // متغيرات لتخزين بيانات الحادث 
  String incidentNumber = "";
  String location = "";
  String numberOfInjured = "";
  String status = "";

  @override
  void initState() {
    super.initState();
    hasIncident = widget.hasIncident;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // العنوان والأيقونة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Ambulance Request',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // أيقونة الإسعاف
            Center(
              child: Image.asset(
                'images/Ambulance.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 20),

            // عرض الحادث أو رسالة "لا يوجد حادث"
            Expanded(
              child: hasIncident ? _buildIncidentDetails() : _buildNoIncident(),
            ),
          ],
        ),
      ),
    );
  }

  // عرض تفاصيل الحادث (فارغة في البداية، لكن سيتم تحديثها لاحقًا)
  Widget _buildIncidentDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 380,
            maxHeight: 220,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFFD1CCC4),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Incident Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.black54),
              const SizedBox(height: 5),

              // البيانات ستكون فارغة حتى يتم تحديثها من خلال الفورم
              _buildDetailRow("Incident Number:", incidentNumber.isNotEmpty ? incidentNumber : "N/A"),
              _buildDetailRow("Location:", location.isNotEmpty ? location : "N/A"),
              _buildDetailRow("Number of Injured:", numberOfInjured.isNotEmpty ? numberOfInjured : "N/A"),
              _buildDetailRow("Status:", status.isNotEmpty ? status : "N/A"),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(
                    "Update",
                    const Color(0xFF9A9185),
                    Colors.black,
                    () async {
                      // انتقل إلى شاشة إنشاء حادث واحصل على القيم المدخلة بعد الرجوع
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateIncidentScreen()),
                      );

                      if (result != null && result is Map<String, String>) {
                        setState(() {
                          incidentNumber = result["incidentNumber"] ?? "";
                          location = result["location"] ?? "";
                          numberOfInjured = result["numberOfInjured"] ?? "";
                          status = result["status"] ?? "";
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  _buildActionButton(
                    "Cancel",
                    const Color(0xFF9A9185),
                    Colors.black,
                    () {
                      setState(() {
                        hasIncident = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // عرض تفاصيل الحادث في سطر واحد
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label ",
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // زر الإجراءات (تحديث أو إلغاء)
  Widget _buildActionButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
    );
  }

  // في حال لم يكن هناك أي حادث
  Widget _buildNoIncident() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/no_incident.png', width: 80, height: 80),
        const SizedBox(height: 10),
        const Text(
          "There are no incidents",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}
