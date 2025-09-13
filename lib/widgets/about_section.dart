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

            // 🔹 Members Section
            Column(
              children: [
                _buildMember(
                  image: "assets/स्वराज्य प्रकाश.jpg",
                  name: "स्वराज्य प्रकाश",
                  description:
                      "पूज्यनीय श्री स्वराज्य प्रकाश (शिक्षक) जी ने ऐसी संस्थान को बनाने हेतु मार्गदर्शन दिया कि सनातन धर्म को वैदिक शिक्षा के साथ-साथ योग, पुराण, उपनिषद्, वेदांग, वेद, श्रीरामचरितमानस अध्ययन कार्यशाला के माध्यम से दी जाए। समय-समय पर वे विभिन्न विद्यालयों में आमंत्रित किए जाते थे। आपकी शिक्षा परास्नातक (भूगोल) हिन्दू महाविद्यालय आगरा विश्वविद्यालय से तथा विधिक शिक्षा कानपुर विश्वविद्यालय से पूर्ण हुई। आपका जन्म 02 मई 1947 को हुआ और देहावसान 11 नवम्बर 2024 को दीर्घकालीन बीमारी के कारण हुआ। आपके पिता कुशल चिकित्सक थे। आपने दुर्बल वर्ग को पुस्तकें, फीस तथा निःशुल्क शिक्षा प्रदान कर जीवन को एक मिशन बना दिया, जिसके कारण संस्थान के गठन में आपका अभूतपूर्व योगदान रहा।",
                ),
                const SizedBox(height: 40),
                _buildMember(
                  image: "assets/शान्ति देवी.jpg",
                  name: "शान्ति देवी",
                  description:
                      "पूज्यनीय श्रीमती शान्ति देवी (शिक्षक) ने अपना जीवन शिक्षा को समर्पित किया, विशेषतः सनातन धर्म की शिक्षा को। आपकी शिक्षा स्नातक थी तथा चिकित्सकीय शिक्षा क्वीन मेरी मेडिकल कॉलेज, लखनऊ एवं उर्सला हॉर्समैन चिकित्सालय, कानपुर से पूर्ण हुई। आपका रुझान वैदिक पूजन एवं सनातन कर्मकाण्ड में था, जिसके कारण महिलाओं को वैदिक एवं तकनीकी शिक्षा की ओर प्रेरित किया। संस्थान के गठन हेतु भूमि एवं आवश्यक पूंजी दान में अपनी स्थिति के अनुसार प्रदान की। आपका जन्म 08 सितंबर 1953 को तथा देहावसान 15 फरवरी 2015 को हुआ।",
                ),
                const SizedBox(height: 40),
                _buildMember(
                  image: "assets/rama_devi.jpg",
                  name: "श्रीमती रमा देवी",
                  description:
                      "कोषाध्यक्ष/ सचिव रामायण वैदिक एजुकेशन फाउंडेशन वर्तमान संरक्षक बालिकाओं और नारियों को स्वावलंबी बनाने में स्ववित्तीय सहयोग और सदस्यों द्वारा अनुदान द्वारा पूर्ण करती हैं",
                ),
              ],
            ),
            const SizedBox(height: 40),

            // 🔹 Merged Container (Modern Style) – Members ke baad
            _buildMergedInfoWithTitle(),
            const SizedBox(height: 60),

            // 🔹 Highlights Grid – Merged container ke baad
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
                  "समाज के कल्याण और उत्थान के लिए निरंतर कार्य करते हैं ...हर व्यक्ति के जीवन में सकारात्मक बदलाव लाने का प्रयास करते हैं।",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Member Widget
  static Widget _buildMember({
    required String image,
    required String name,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7EC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(image, height: 150, width: 120, fit: BoxFit.cover),
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
  static Widget _buildHighlight(String icon, String title, String description) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 4),
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

  // 🔹 Modern Merged Info Container with Title & Description
  static Widget _buildMergedInfoWithTitle() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFF7EC), Color(0xFFFFE0B2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(3, 6),
          ),
        ],
        border: Border.all(color: Colors.orangeAccent, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title with underline
          Text(
            "हमारे बारे में",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange.shade800,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            width: 60,
            height: 3,
            color: Colors.deepOrange.shade400,
          ),
          const SizedBox(height: 15),

          // Subtitle
          const Text(
            "वैदिक शिक्षा और सनातन संस्कारों के प्रचार-प्रसार में समर्पित हमारा संगठन",
            style: TextStyle(fontSize: 15, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // Main content
          const Text(
            "ॐ दाशरथये विद्महे सीतावल्लभाय धीमहि तन्नो राम प्रचोदयात्\n\n"
            "🌸 रामायण वैदिक एजुकेशन फाउंडेशन 🌸\n\n"
            "संस्था का मुख्य उद्देश्य भारतीय वैदिक संस्कृति, रामायण, वेद, उपनिषद्, गीता आदि का प्रचार-प्रसार करना है।\n"
            "सभी वर्गों को वैदिक शिक्षा उपलब्ध कराना, युवाओं को संस्कारित बनाना और समाज को धार्मिक मार्गदर्शन देना है।\n\n"
            "🌸 सोसायटी पंजीकरण अधिनियम 1860 उप धारा 21 के अंतर्गत पंजीकरण है।\n"
            "🌸 साइबर सुरक्षा अधिनियम का पालन किया गया है।\n\n"
            "हिन्दू कैलेंडर के अनुसार हिन्दू नववर्ष का आरंभ चैत्र महीने के शुक्ल पक्ष की प्रतिपदा तिथि 30 मार्च, 2025 से हो रहा है। यह विक्रम संवत 2082 को हुआ।\n\n"
            "🌸 समस्त देखभाल और संरक्षण श्रीमती रमा दीक्षित जी के पास सुरक्षित है 🌸\n\n"
            "👉 उद्देश्य:\n"
            "1. आत्म साक्षात्कार, चिंतन, मंथन हेतु है।\n"
            "2. नारियों को स्वालंबी और आत्म निर्भर बनाना।\n"
            "3. नशा उन्मूलन और युवा शक्ति को सृजनात्मक दिशा में प्रेरित करना।\n\n"
            "नोट: इस संस्था किसी भी पद को सुरक्षित नहीं करती है। इसके संस्थापक श्रीमती बैकुंठवासी स्वराज्य प्रकाश जी एवं शांति देवी जी हैं।\n\n"
            "👉 निःशुल्क विधिक सेवाएं अधिवक्ता श्री दिव्यांशु कुमार जी एवं श्रीमती रुचि देवी जी (उच्च न्यायालय) एवं श्री सुधाकर कुमार जी (सत्रीय न्यायालय) द्वारा नियमित रूप निगरानी की जा रही है।\n\n"
            "👉 यह रामायण वैदिक एजुकेशन फाउंडेशन किसी को सरकारी नौकरियों, किसी व्यावसायिक प्रतिष्ठान नौकरी का लोभ, मानदेय इत्यादि देने का लाभ नहीं देता है। इसमें सेवा निःशुल्क सहयोगी होने का महत्व है। वेबसाइट का अवलोकन ऑनलाइन करें।\n\n"
            "आप सभी का हार्दिक अभिवादन।",
            style: TextStyle(fontSize: 14, height: 1.6, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
