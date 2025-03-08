import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async' show Future, Timer;
import 'package:yusur_app/widget/arrow.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({Key? key}) : super(key: key);

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  String selectedCity = "Makkah"; // المدينة المختارة
  Map<String, String>? prayerTimes;
  DateTime date = DateTime.now();
  String nextPrayer = "Loading...";
  String timeRemaining = "--:--";
  Timer? _timer; // تعريف المؤقت

  @override
  void initState() {
    super.initState();
    _fetchPrayerTimesForCity(selectedCity, 4);
    _startTimer(); // بدء التحديث الدوري
  }

  @override
  void dispose() {
    _timer?.cancel(); // إلغاء المؤقت عند التدمير
    super.dispose();
  }

  // بدء التحديث الدوري
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (prayerTimes != null) {
        _calculateNextPrayer(); // تحديث الوقت المتبقي كل ثانية
      }
    });
  }

  Future<void> _fetchPrayerTimesForCity(String city, int method) async {
    final String url =
        "https://api.aladhan.com/v1/calendarByAddress?address=$city&method=$method&year=${date.year}&month=${date.month}";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        int todayIndex = date.day - 1;
        final timings = data['data'][todayIndex]['timings'];

        setState(() {
          selectedCity = city;
          prayerTimes = {
            'Fajr': timings['Fajr'],
            'Sunrise': timings['Sunrise'],
            'Dhuhr': timings['Dhuhr'],
            'Asr': timings['Asr'],
            'Maghrib': timings['Maghrib'],
            'Isha': timings['Isha'],
          };
          _calculateNextPrayer(); // تحديث الصلاة القادمة عند جلب الأوقات
        });
      } else {
        throw Exception('❌ فشل في جلب مواقيت الصلاة');
      }
    } catch (e) {
      print("⚠️ خطأ أثناء جلب الأوقات: $e");
      setState(() {
        prayerTimes = null;
      });
    }
  }

  void _calculateNextPrayer() {
    DateTime now = DateTime.now();
    String? upcomingPrayer;
    Duration? minDifference;

    // تحويل أوقات الصلاة إلى قائمة وترتيبها بحسب الوقت
    List<MapEntry<String, String>> prayerList = prayerTimes!.entries.toList();
    prayerList.sort((a, b) {
      DateTime timeA = _parsePrayerTime(a.value);
      DateTime timeB = _parsePrayerTime(b.value);
      return timeA.compareTo(timeB);
    });

    // البحث عن الصلاة القادمة بعد الوقت الحالي
    for (var entry in prayerList) {
      DateTime prayerTime = _parsePrayerTime(entry.value);
      Duration difference = prayerTime.difference(now);
      if (difference.inSeconds > 0) {
        upcomingPrayer = entry.key;
        minDifference = difference;
        break;
      }
    }

    if (upcomingPrayer != null && minDifference != null) {
      setState(() {
        nextPrayer = upcomingPrayer!;
        timeRemaining =
            "${minDifference!.inHours.toString().padLeft(2, '0')}:"
            "${(minDifference.inMinutes % 60).toString().padLeft(2, '0')}:";
        "${(minDifference.inSeconds % 60).toString().padLeft(2, '0')}";
      });
    } else {
      // إذا كانت جميع الصلوات قد مضت، نحسب الوقت المتبقي لصلاة الفجر في اليوم التالي
      DateTime fajrTime = _parsePrayerTime(prayerTimes!['Fajr']!);
      DateTime fajrTomorrow = fajrTime.add(Duration(days: 1));
      Duration difference = fajrTomorrow.difference(now);
      setState(() {
        nextPrayer = "Fajr";
        timeRemaining =
            "${difference.inHours.toString().padLeft(2, '0')}:"
            "${(difference.inMinutes % 60).toString().padLeft(2, '0')}:"
            "${(difference.inSeconds % 60).toString().padLeft(2, '0')}";
      });
    }
  }

  DateTime _parsePrayerTime(String time) {
    final DateFormat inputFormat = DateFormat("HH:mm");
    final DateTime parsedTime = inputFormat.parse(time);

    // استخدم الوقت الحالي بدلاً من التاريخ الثابت
    DateTime now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  String timeFormat(String time) {
    final DateFormat inputFormat = DateFormat("HH:mm");
    final DateTime datetime = inputFormat.parse(time);
    final DateFormat outputFormat = DateFormat("hh:mm a");
    return outputFormat.format(datetime);
  }

  @override
  Widget build(BuildContext context) {
    if (prayerTimes == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Prayer Time",
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            // 🔹 أزرار اختيار المدينة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCityButton("Makkah"),
                SizedBox(width: 15),
                _buildCityButton("Madinah"),
              ],
            ),
            SizedBox(height: 20),

            // 🔹 عرض اسم المدينة والتاريخ
            Text(
              selectedCity,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "${date.day}/${DateFormat('MMM').format(date)}/${date.year}",
              style: TextStyle(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35),

            // 🔹 عرض وقت الصلاة التالي والمدة المتبقية
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 243),
                border: Border.all(color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next Prayer: $nextPrayer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    timeRemaining,
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),

            // 🔹 جدول مواقيت الصلاة
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 243),
                border: Border.all(color: Color(0xFFD9D9D9)),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildPrayerTimeRow("Fajr", prayerTimes!['Fajr']!),
                  _buildPrayerTimeRow("Sunrise", prayerTimes!['Sunrise']!),
                  _buildPrayerTimeRow("Dhuhr", prayerTimes!['Dhuhr']!),
                  _buildPrayerTimeRow("Asr", prayerTimes!['Asr']!),
                  _buildPrayerTimeRow("Maghrib", prayerTimes!['Maghrib']!),
                  _buildPrayerTimeRow("Isha", prayerTimes!['Isha']!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityButton(String city) {
    return ElevatedButton(
      onPressed: () {
        if (selectedCity != city) {
          _fetchPrayerTimesForCity(city, 4);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedCity == city ? const Color(0xFFB7AD9F) : Colors.grey[300],
        foregroundColor: selectedCity == city ? Colors.white : Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(city, style: TextStyle(fontSize: 18)),
    );
  }

  Widget _buildPrayerTimeRow(String prayerName, String prayerTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prayerName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(timeFormat(prayerTime), style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
