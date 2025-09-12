import 'package:flutter/material.dart';
import '../services/contact_service.dart'; // Firebase service

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  final ContactService _contactService = ContactService();

  @override
  void dispose() {
    nameController.dispose();
    subjectController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    try {
      await _contactService.submitForm(
        name: nameController.text,
        subject: subjectController.text,
        phone: phoneController.text,
        message: messageController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ संदेश सफलतापूर्वक भेजा गया")),
      );

      // Clear fields
      nameController.clear();
      subjectController.clear();
      phoneController.clear();
      messageController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade50,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "📞 संपर्क फ़ॉर्म",
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "हमसे संपर्क करने के लिए कृपया नीचे दिया गया फ़ॉर्म भरें या हमारी जानकारी का उपयोग करें।",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactForm()),
                      const SizedBox(width: 20),
                      Expanded(child: _buildContactInfo()),
                    ],
                  );
                } else {
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
            _buildOfficeHours(),
          ],
        ),
      ),
    );
  }

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
              controller: nameController,
              decoration: InputDecoration(
                hintText: "आपका नाम लिखें",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("विषय *"),
            const SizedBox(height: 6),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(
                hintText: "संदेश का विषय",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("फ़ोन नंबर *"),
            const SizedBox(height: 6),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "आपका फ़ोन नंबर",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            const Text("संदेश *"),
            const SizedBox(height: 6),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "आपका संदेश लिखें",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _submitForm,
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

  Widget _buildContactInfo() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("संपर्क जानकारी",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            SizedBox(height: 20),
            Row(children: [
              Icon(Icons.phone, color: Colors.orange),
              SizedBox(width: 8),
              Text("+91 7307214280"),
            ]),
            SizedBox(height: 16),
            Row(children: [
              Icon(Icons.email, color: Colors.orange),
              SizedBox(width: 8),
              Text("ramayanvedicngo@gmail.com"),
            ]),
            SizedBox(height: 16),
            Row(children: [
              Icon(Icons.location_on, color: Colors.orange),
              SizedBox(width: 8),
              Expanded(
                  child: Text(
                      "रामायण भवन\nरामायण वैदिक एजुकेशन फाउंडेशन\nउत्तर प्रदेश राज्य औद्योगिक विकास प्राधिकरण के सामने, नक्षत्र गार्डन, गोला रोड\nलखीमपुर खीरी 262701")),
            ]),
          ],
        ),
      ),
    );
  }

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
            Text("कार्यालय समय",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10),
            Text("सोमवार - शनिवार: प्रातः 04:00 बजे से 4:00 बजे तक",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 6),
            Text("रविवार: बंद",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
