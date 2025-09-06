import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade50,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Title
            const Text(
              "📞 संपर्क फ़ॉर्म",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // 🔹 Description
            const Text(
              "हमसे संपर्क करने के लिए कृपया नीचे दिया गया फ़ॉर्म भरें या हमारी जानकारी का उपयोग करें।",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // 🔹 Main Row (Form + Contact Info)
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  // Desktop / Tablet (side by side)
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactForm()),
                      const SizedBox(width: 20),
                      Expanded(child: _buildContactInfo()),
                    ],
                  );
                } else {
                  // Mobile (stacked)
                  return Column(
                    children: [
                      _buildContactForm(),
                      const SizedBox(height: 20),
                      _buildContactInfo(),
                    ],
                  );
                }
              },
            ),

            const SizedBox(height: 30),

            // 🔹 Office Hours Section
            _buildOfficeHours(),
          ],
        ),
      ),
    );
  }

  // 🔹 Contact Form UI
  Widget _buildContactForm() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("शुभ नाम *"),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: "आपका नाम लिखें",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("विषय *"),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: "संदेश का विषय",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("फ़ोन नंबर *"),
            const SizedBox(height: 6),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "आपका फ़ोन नंबर",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("संदेश *"),
            const SizedBox(height: 6),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "आपका संदेश लिखें",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Elevated Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                icon: const Icon(Icons.send),
                label: const Text(
                  "संदेश भेजें",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 Contact Info UI
  Widget _buildContactInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "संपर्क जानकारी",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            _buildInfoRow(Icons.phone, "फ़ोन", "+91 7307214280"),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.email, "ईमेल", "ramayanvedicngo@gmail.com"),
            const SizedBox(height: 16),
            _buildInfoRow(Icons.location_on, "पता",
                "रामायण भवन\nरामायण वैदिक एजुकेशन फाउंडेशन\nउत्तर प्रदेश राज्य औद्योगिक विकास प्राधिकरण के सामने, नक्षत्र गार्डन, गोला रोड\nलखीमपुर खीरी 262701"),
          ],
        ),
      ),
    );
  }

  // 🔹 Info Row Helper
  Widget _buildInfoRow(IconData icon, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, color: Colors.orange),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 🔹 Office Hours Section
  Widget _buildOfficeHours() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: const Column(
          children: [
            Text(
              "कार्यालय समय",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "सोमवार - शनिवार: प्रातः 04:00 बजे से 4:00 बजे तक",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              "रविवार: बंद",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
