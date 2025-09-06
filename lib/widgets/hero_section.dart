import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onWorkshopTap;

  const HeroSection({
    super.key,
    required this.onAboutTap,
    required this.onWorkshopTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDF6EC), // halka cream background
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Texts + Buttons
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading with orange highlight
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "वैदिक ज्ञान का ",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "प्रकाश",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "सनातन धर्म की शिक्षा और संस्कारों को आगे बढ़ाने का हमारा संकल्प",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 20),

                const Text(
                  "हमारा उद्देश्य वैदिक शिक्षा और सनातन संस्कारों को नई पीढ़ी तक पहुँचाना है। "
                  "हम रामायण, गीता और अन्य धार्मिक ग्रंथों की शिक्षा के माध्यम से समाज में "
                  "आध्यात्मिक जागरूकता लाने का कार्य कर रहे हैं।",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 30),

                Image.asset(
                  "assets/ramayan.png", // 👈 apni image ka path yaha daalna
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),

                // ✅ Buttons Wrap (overflow fix)
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: onAboutTap, // 🔹 callback use
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "हमारे बारे में जानें",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Center(
                      child: OutlinedButton(
                        onPressed: onWorkshopTap, // 🔹 callback use
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.orange, width: 2),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "कार्यशाला में भाग लें",
                          style: TextStyle(color: Colors.orange, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
