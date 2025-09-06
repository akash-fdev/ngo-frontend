import 'package:flutter/material.dart';
import 'donate_info_page.dart'; // ✅ ab ye file import karni h

class WorkshopSection extends StatelessWidget {
  const WorkshopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> workshopImages = [
      "assets/workshop/srimad.jpg",
      "assets/workshop/ramayan.jpg",
      "assets/workshop/vedmantr.jpg",
      "assets/workshop/sansbhasa.jpg",
      "assets/workshop/yogdha.jpg",
      "assets/workshop/aayuvond.jpg",
      "assets/workshop/dharmik.jpg",
      "assets/workshop/vedik gadit.jpg",
      "assets/workshop/vedik khagol.jpg",
      "assets/workshop/vedik poojan.jpg",
      "assets/workshop/ved.jpg",
      "assets/workshop/vedang.jpg",
      "assets/workshop/ramcharitmanas.jpg",
    ];

    final List<String> workshopTitles = [
      "श्रीमद्भगवद गीता",
      "रामायण अध्ययन",
      "वैदिक मंत्र",
      "संस्कृत भाषा",
      "योग साधना",
      "आयुर्वेद विज्ञान",
      "धार्मिक अनुष्ठान",
      "वैदिक गणित",
      "वैदिक खगोल",
      "वैदिक पूजन विधि",
      "वेद अध्ययन",
      "वेदांग शिक्षा",
      "श्री राम चरित मानस अध्ययन",
    ];

    final List<String> workshopDescriptions = [
      "जीवन के मार्गदर्शन के लिए गीता के श्लोकों का अध्ययन",
      "श्री राम के आदर्शों और जीवन मूल्यों की शिक्षा",
      "वैदिक मंत्रों का उच्चारण और अर्थ की जानकारी",
      "देवभाषा संस्कृत के मूलभूत सिद्धांतों की शिक्षा",
      "शारीरिक और मानसिक स्वास्थ्य के लिए योग प्रशिक्षण",
      "प्राकृतिक चिकित्सा और स्वास्थ्य की पारंपरिक पद्धति",
      "जीवन के विभिन्न संस्कारों की विधि और महत्व",
      "प्राचीन भारतीय गणना विधियों पर आधारित तेज़, सहज और मानसिक गणना की प्रणाली",
      "यह प्राचीन भारतीय ज्योतिष और खगोलशास्त्र की वह विद्या है जो वेदों पर आधारित है।",
      "वेदों में वर्णित शुद्ध और वैज्ञानिक विधियों से की जाने वाली पूजा प्रक्रिया।",
      "हिंदू धर्म के मूल और सर्वोच्च ग्रंथ, जो ज्ञान, कर्म और उपासना के आधार हैं।",
      "वेदों को समझने और उनके प्रयोग में सहायक छह अंग विद्या, जैसे व्याकरण, छंद, ज्योतिष आदि।",
      "गोस्वामी तुलसीदास द्वारा रचित रामायण का भावनात्मक और आध्यात्मिक रूप से अध्ययन।",
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFEFFFEF),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "🌿 सनातन कार्यशाला",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 30),

          // 🔹 Grid
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: List.generate(workshopImages.length, (index) {
                return WorkshopCard(
                  imagePath: workshopImages[index],
                  title: workshopTitles[index],
                  description: workshopDescriptions[index],
                  onTap: () {
                    // ✅ ab ye DonateInfoPage kholega
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DonateInfoPage(),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkshopCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const WorkshopCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  State<WorkshopCard> createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  bool isHovered = false;
  bool isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 280,
          decoration: BoxDecoration(
            color: isHovered ? Colors.green.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
            boxShadow: [
              BoxShadow(
                color: isHovered
                    ? Colors.green.withOpacity(0.3)
                    : Colors.black.withOpacity(0.12),
                blurRadius: isHovered ? 12 : 8,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  widget.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              MouseRegion(
                onEnter: (_) => setState(() => isButtonHovered = true),
                onExit: (_) => setState(() => isButtonHovered = false),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: widget.onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonHovered
                          ? Colors.green.shade700
                          : Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "कार्यशाला में भाग लें",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
