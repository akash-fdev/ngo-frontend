import 'package:flutter/material.dart';

class DonateInfoPage extends StatelessWidget {
  const DonateInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0), // हल्का orange bg
      appBar: AppBar(
        title: const Text(
          "दान जानकारी",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "सनातन धर्म शिक्षा के लिए दान दे",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "वैदिक शिक्षा के प्रसार में हमारा साथ दें",
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // 🔹 छोटे कार्ड्स
            const DonateCard(
              icon: Icons.menu_book,
              title: "चार वेद",
              description:
                  "ऋग्वेद, यजुर्वेद, सामवेद और अथर्ववेद — ये चार वेद हिंदू धर्म की आध्यात्मिक नींव हैं।",
            ),
            const SizedBox(height: 12),
            const DonateCard(
              icon: Icons.book,
              title: "वेदांग",
              description:
                  "शिक्षा, कल्प, व्याकरण, निरुक्त, छंद और ज्योतिष — ये वेदांग वेदों को समझने में सहायक हैं।",
            ),
            const SizedBox(height: 12),
            const DonateCard(
              icon: Icons.edit,
              title: "मुख्य उपनिषद",
              description:
                  "ईशा, केन, कठ, प्रश्न, मुण्डक, मांडूक्य, तैत्तिरीय आदि प्रमुख उपनिषद वेदांत दर्शन के आधार हैं।",
            ),
            const SizedBox(height: 12),
            const DonateCard(
              icon: Icons.local_fire_department,
              title: "सनातन पूजन विधि",
              description:
                  "शुद्धि, संकल्प, पंचामृत, पुष्प, दीप, नैवेद्य, आरती और विसर्जन जैसे चरण आत्म-विकास दर्शाते हैं।",
            ),

            const SizedBox(height: 20),

            // 🔹 QR + UPI section
            const QRDonateCard(),
            const SizedBox(height: 16),
            const UPIDonateCard(),
            const SizedBox(height: 16),

            // 🔹 Bank Details Section
            const BankDetailsCard(),
            const SizedBox(height: 16),

            // 🔹 Confirm Payment Section (New)
            const ConfirmPaymentCard(),
          ],
        ),
      ),
    );
  }
}

// Small Card
class DonateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const DonateCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.deepOrange, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

// QR Card
class QRDonateCard extends StatelessWidget {
  const QRDonateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Icon(Icons.qr_code, color: Colors.deepOrange, size: 28),
                SizedBox(width: 8),
                Text(
                  "QR कोड से भुगतान",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/qr.jpg", // apna qr code image assets me daalo
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "अपने फोन के कैमरे या किसी भी UPI ऐप से QR कोड स्कैन करें",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

// UPI Card
class UPIDonateCard extends StatelessWidget {
  const UPIDonateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.phone_android, color: Colors.deepOrange, size: 28),
                SizedBox(width: 8),
                Text(
                  "UPI भुगतान",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orangeAccent),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "ramayanvediceducational@indianbk",
                      style: TextStyle(
                        fontFamily: "monospace",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(Icons.copy, size: 20, color: Colors.black54),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "समर्थित UPI ऐप्स:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                UPIAppButton(label: "  Google Pay    "),
                UPIAppButton(label: "   PhonePe     "),
                UPIAppButton(label: "     Paytm          "),
                UPIAppButton(label: "     BHIM          "),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// UPI App Button
class UPIAppButton extends StatelessWidget {
  final String label;
  const UPIAppButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        side: const BorderSide(color: Colors.black26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

// 🔹 Bank Details Card
class BankDetailsCard extends StatelessWidget {
  const BankDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.account_balance, color: Colors.deepOrange, size: 28),
                SizedBox(width: 8),
                Text(
                  "बैंक विवरण",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 20),

            // Account Name
            buildDetailBox("खाता नाम:", "रामायण वैदिक एजुकेशन फाउंडेशन"),

            const SizedBox(height: 12),

            // IFSC Code
            buildDetailBox("IFSC कोड:", "IDIB000L554", showCopy: true),

            const SizedBox(height: 12),

            // Account Number
            buildDetailBox("खाता संख्या:", "7728397001", showCopy: true),

            const SizedBox(height: 12),

            // Bank Name
            buildDetailBox("बैंक का नाम:", "इंडियन बैंक"),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "महत्वपूर्ण सूचना:\nकृपया भुगतान के बाद अपना ट्रांजेक्शन ID और संपर्क विवरण हमें भेजें। आपका दान 80G के तहत कर छूट के लिए पात्र है।",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildDetailBox(String title, String value,
      {bool showCopy = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
          if (showCopy) const Icon(Icons.copy, size: 18, color: Colors.black54),
        ],
      ),
    );
  }
}

// 🔹 Payment Confirmation Card
class ConfirmPaymentCard extends StatelessWidget {
  const ConfirmPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "भुगतान की पुष्टि के लिए",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            "भुगतान के बाद कृपया हमसे संपर्क करें और अपना ट्रांजेक्शन ID साझा करें",
            style: TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Column instead of Row
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "+91 7307214280",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "ramayanvedicngo@gmail.com",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
