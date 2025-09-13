import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

// 🔹 Clock Widget (देवनागरी अंक वाली एनालॉग घड़ी)
class KalachakraClock extends StatefulWidget {
  const KalachakraClock({super.key});

  @override
  State<KalachakraClock> createState() => _KalachakraClockState();
}

class _KalachakraClockState extends State<KalachakraClock> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: CustomPaint(
            painter: _ClockPainter(_now),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "कालचक्र",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        const Text(
          "देवनागरी अंकों सहित वैदिक घड़ी",
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

// 🔹 Painter for Analog Clock
class _ClockPainter extends CustomPainter {
  final DateTime time;
  _ClockPainter(this.time);

  final devanagariNumbers = [
    "१२", "१", "२", "३", "४", "५",
    "६", "७", "८", "९", "१०", "११"
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    final fillBrush = Paint()..color = const Color(0xFFFFE4B5);
    final outlineBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(center, radius, fillBrush);
    canvas.drawCircle(center, radius, outlineBrush);

    // Numbers (देवनागरी)
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (int i = 0; i < 12; i++) {
      final angle = (i * 30 - 60) * pi / 180;
      final offset = Offset(
        center.dx + (radius - 30) * cos(angle),
        center.dy + (radius - 30) * sin(angle),
      );

      textPainter.text = TextSpan(
        text: devanagariNumbers[i],
        style: const TextStyle(fontSize: 18, color: Colors.brown),
      );
      textPainter.layout();
      canvas.save();
      canvas.translate(
        offset.dx - textPainter.width / 2,
        offset.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }

    // Hands
    final hourAngle = (time.hour % 12 + time.minute / 60) * 30 * pi / 180;
    final minuteAngle = (time.minute + time.second / 60) * 6 * pi / 180;
    final secondAngle = time.second * 6 * pi / 180;

    // Hour hand
    final hourHand = Paint()
      ..color = Colors.brown
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      center + Offset(50 * cos(hourAngle - pi / 2), 50 * sin(hourAngle - pi / 2)),
      hourHand,
    );

    // Minute hand
    final minuteHand = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      center + Offset(70 * cos(minuteAngle - pi / 2), 70 * sin(minuteAngle - pi / 2)),
      minuteHand,
    );

    // Second hand
    final secondHand = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    canvas.drawLine(
      center,
      center + Offset(80 * cos(secondAngle - pi / 2), 80 * sin(secondAngle - pi / 2)),
      secondHand,
    );

    // Center dot
    canvas.drawCircle(center, 6, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// 🔹 Hero Section with Clock at the Bottom (LEFT side ke niche)
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
      color: const Color(0xFFFDF6EC),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: Texts + Buttons + Clock
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
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
                  "assets/ramayan.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),

                // Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: onAboutTap,
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
                    OutlinedButton(
                      onPressed: onWorkshopTap,
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
                  ],
                ),

                const SizedBox(height: 40),

                // 🔹 Clock added here at the bottom
                const Center(child: KalachakraClock()),
              ],
            ),
          ),

          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
