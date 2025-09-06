import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TopMarquee extends StatelessWidget {
  const TopMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDE9C9), // halka cream bg
      height: 35,
      child: Marquee(
        text: "ॐ दशरथये विद्महे, सीता वल्लभाय धीमहि, तन्नो रामः प्रचोदयात्।    ",
        style: const TextStyle(
          fontSize: 16,
          color: Colors.deepOrange,
          fontWeight: FontWeight.w600,
        ),
        velocity: 40.0,
        blankSpace: 100.0,
        pauseAfterRound: const Duration(seconds: 1),
      ),
    );
  }
}
