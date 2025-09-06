import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String activeSection;
  final Function(String) onNavTap;

  const NavBar({
    super.key,
    required this.activeSection,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 🔹 Left side Logo
        Row(
          children: [
            Image.asset("assets/logo.jpg", height: 40),
            const SizedBox(width: 8),
            const Text(
              "रामायण वैदिक एजुकेशन फाउंडेशन",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),

        // 🔹 Right side nav buttons (Desktop only)
        if (screenWidth > 1200)
          Row(
            children: [
              _navItem("मुख्य पृष्ठ"),
              _navItem("हमारे बारे में"),
              _navItem("घोषणा"),
              _navItem("सनातन कार्यशाला"),
              _navItem("चित्रमाला"),
              _navItem("संपर्क"),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => onNavTap("दान करें"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: activeSection == "दान करें"
                      ? Colors.deepOrange
                      : Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "दान करें",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _navItem(String title) {
    final isActive = (title == activeSection);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => onNavTap(title),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.orange : Colors.black87,
          ),
        ),
      ),
    );
  }
}
