import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Title
            Column(
              children: const [
                Text(
                  "हमारे कमेटी के बारे में",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "वैदिक शिक्षा और सनातन संस्कारों के प्रचार-प्रसार में समर्पित हमारा संगठन",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 40),

            // 🔹 Members Section (overflow fix → Column instead of Row)
            Column(
              children: [
                _buildMember(
                  image: "assets/स्वराज्य प्रकाश.jpg",
                  name: "स्वराज्य प्रकाश",
                  description:
                      "पूज्यनीय श्री स्वराज्य प्रकाश (शिक्षक) जी ने ऐसी संस्थान को बनाने हेतु मार्गदर्शन दिया कि सनातन धर्म को वैदिक शिक्षा के साथ साथ में योग, पुराण, उपनिषद्, वेदांक, वेद, श्री राम चरित मानस अध्ययन कार्यशाला के माध्यम से दी जाए इसके लिए समय पर वे विभिन्न विद्यालयों में उनको बुलाया जाता था आपकी शिक्षा परास्नातक (भूगोल) हिन्दू महाविद्यालय आगरा विश्वविद्यालय, आगरा से पूर्ण किया उसके उपरांत विधिक शिक्षा कानपुर विश्वविद्यालय, कानपुर से पूर्ण किया आपका जन्म 02 मई 1947 में हुआ और आपका देहावसान 11 नवम्बर 2024 को लंबी बीमारी के चलते रहने के कारण हुआ आपके पिता जी कुशल चिकित्सक थे और आप दुर्बल वर्ग को पुस्तकों को देना, उनकी फीस देना, निःशुल्क शिक्षा देते हुए सम्पूर्ण जीवन में वे एक मिशन बना दिया जिसके कारण यह संस्थान का गठन करने में उनका अभूतपूर्व प्रयास किया",
                ),
                const SizedBox(height: 40),
                _buildMember(
                  image: "assets/शान्ति देवी.jpg",
                  name: "शान्ति देवी",
                  description:
                      "पूज्यनीय श्रीमती शान्ति देवी (शिक्षक) अपना जीवन शिक्षा को समर्पित किया जिसमें सनातन धर्म की शिक्षा विशेष रूप से है आपकी शिक्षा स्नातक थी और आपकी चिकित्सकीय शिक्षा क्वीन मेरी मेडिकल कॉलेज लखनऊ , उर्सला हॉर्स मैन चिकित्सालय, कानपुर से पूर्ण की था और आपका रुझान वैदिक पूजन और सनातन कर्मकाण्ड में था जिसके कारण महिलाओं को वैदिक शिक्षा और तकनीकी शिक्षा की और प्रयास किया जिसके चलते उहोंने संस्थान के गठन हेतुभूमि और आवश्यक पूंजी दान में अपनी स्थिति के अनुसार किया गया है आपका जन्म 08 सितंबर 1953 को हुआ और देहावसान 15 फ़रवरी 2015 को हुआ था",
                ),
              ],
            ),
            const SizedBox(height: 60),

            // 🔹 Highlights Grid (already responsive using Wrap)
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildHighlight(
                  "❤️",
                  "सुचिता",
                  "हमारा संगठन पवित्रता और सत्यता के सिद्धांतों पर आधारित है। हम सभी कार्यों में ईमानदारी और निष्पक्षता बनाए रखते हैं।",
                ),
                _buildHighlight(
                  "📖",
                  "रामायण संस्थान",
                  "रामायण के महान आदर्शों और शिक्षाओं को समाज में फैलाने का कार्य करते हैं। श्री राम के जीवन से प्रेरणा लेकर आगे बढ़ते हैं।",
                ),
                _buildHighlight(
                  "⭐",
                  "ग्रंथ सेवा",
                  "पवित्र ग्रंथों की सेवा और संरक्षण करना हमारा मुख्य उद्देश्य है। हम धार्मिक साहित्य को सुरक्षित रखने में योगदान देते हैं।",
                ),
                _buildHighlight(
                  "👥",
                  "प्रारिययत्ति",
                  "शिक्षा के क्षेत्र में नवाचार और उत्कृष्टता लाने का प्रयास करते हैं। आधुनिक तकनीक के साथ पारंपरिक ज्ञान का संयोजन करते हैं।",
                ),
                _buildHighlight(
                  "🏆",
                  "अभ्युदय",
                  "समाज के कल्याण और उत्थान के लिए निरंतर कार्य करते हैं ...हर व्यक्ति के जीवन में सकारात्मक बदलाव लाने का प्रयास करते हैं।                                                                   ",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Member Widget
  Widget _buildMember({
    required String image,
    required String name,
    required String description,
  }) {
    return SizedBox(
      width: 350, // ✅ fix width so card center align
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  // 🔹 Highlight Card Widget
  Widget _buildHighlight(String icon, String title, String description) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
