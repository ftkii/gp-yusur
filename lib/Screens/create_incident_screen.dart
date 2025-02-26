import 'package:flutter/material.dart';
import 'current_incident_screen.dart';

class CreateIncidentScreen extends StatefulWidget {
  @override
  _CreateIncidentScreenState createState() => _CreateIncidentScreenState();
}

class _CreateIncidentScreenState extends State<CreateIncidentScreen> {
  int injuredCount = 1;
  String selectedPerson = "I am the injured";
  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  العنوان والسهم
                    Row(
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
                    const SizedBox(height: 20),

                    //  أيقونة سيارة الإسعاف
                    Center(
                      child: Image.asset(
                        'images/Ambulance.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 30),

                    
                    const Text(
                      "Please complete the following steps to create the incident",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    //  اختيار المصاب
                    const Text(
                      "Who is the injured person?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        _buildToggleButton("I am the injured"),
                        const SizedBox(width: 10),
                        _buildToggleButton("Another person"),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // اختيار الموقع مؤقت
                    const Text(
                      "The incident location?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField("Al Riyadh, 17364, Saudi Arabia", "Edit"),

                    const SizedBox(height: 20),

                    //  اختيار عدد المصابين
                    const Text(
                      "The number?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildNumberSelector(),

                    const SizedBox(height: 20),

                    //  اختيار تصنيف الحادث
                    const Text(
                      "Incident category",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.0,
                      children: [
                        _buildCategoryItem("Accidents", "images/accident.png"),
                        _buildCategoryItem("Diseases", "images/disease.png"),
                        _buildCategoryItem("Poisoning", "images/poison.png"),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            //  زر الإرسال
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9A9185),
                    foregroundColor: const Color.fromARGB(255, 41, 40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CurrentIncidentScreen(hasIncident: true),
                      ),
                    );
                  },
                  child: const Text(
                    "Submit Request",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  زر التبديل (اختيار المصاب)
  Widget _buildToggleButton(String title) {
    bool isSelected = selectedPerson == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPerson = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF9A9185) : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 54, 54, 54),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String text, String buttonText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis, 
              softWrap: false,
              maxLines: 1,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              buttonText,
              style: const TextStyle(color: Color(0xFF666059)),
            ),
          ),
        ],
      ),
    );
}


  Widget _buildNumberSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Number of injured"),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (injuredCount > 1) injuredCount--;
                  });
                },
              ),
              Text(
                injuredCount.toString(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    injuredCount++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  //   تصنيف الحوادث
  Widget _buildCategoryItem(String title, String iconPath) {
    bool isSelected = selectedCategory == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF9A9185) : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 35, height: 35),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4A4A4A))),
          ],
        ),
      ),
    );
  }
}
