import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;

class GallerySection extends StatefulWidget {
  const GallerySection({super.key});

  @override
  State<GallerySection> createState() => _GallerySectionState();
}

class _GallerySectionState extends State<GallerySection> {
  int _current = 0;

  final List<Map<String, String>> galleryItems = [
    {
      "image": "assets/gallery/image1.jpg",
      "caption": "रंगोत्सव होली का आयोजन किया गया",
    },
    {
      "image": "assets/gallery/image2.jpg",
      "caption": "दुर्बल वर्ग को पुस्तकों का वितरण",
    },
    {
      "image": "assets/gallery/image3.jpg",
      "caption": "दुर्बल वर्ग की बच्चों को पुस्तकों का वितरण",
    },
    {
      "image": "assets/gallery/image4.jpg",
      "caption": "रामायण वैदिक एजुकेशन फाउंडेशन का निज कार्यशाला एवं कार्यालय निर्माण",
    },
    {"image": "assets/gallery/image5.jpg", "caption": "वैदिक खगोल यंत्र पूजन"},
    {"image": "assets/gallery/image6.jpg", "caption": "वेद माता गायत्री पूजन गायत्री जयंती पर कार्यक्रम आयोजित"},
    {"image": "assets/gallery/image7.jpg", "caption": "कंवर में शिव भक्तों ने रामायण वैदिक एजुकेशन फाउंडेशन परिवार द्वारा कार्यालय परिसर में रुकने के लिए विद्युत और जल की व्यवस्था की गई"},
    {"image": "assets/gallery/image8.jpg", "caption": "गौ सेवा को गठित कार्यकारणी द्वारा स्वच्छ पेयजल की व्यवस्था करना घोषित हुआ"},
    {"image": "assets/gallery/image9.jpg", "caption": "यज्ञ का आयोजन किया गया जिसमे श्री रामायण वैदिक एजुकेशन फाउंडेशन परिवार द्वारा सक्रिय भाग लिया गया"},
    {"image": "assets/gallery/image10.jpg", "caption": "रामायण वैदिक एजुकेशन फाउंडेशन परिवार द्वारा आयोजित छटी का श्रृंगात्मिक स्वरूप के दर्शन श्रीमती रमा राघवेन्द्र जी द्वारा आयोजित एवं संचालन संपन्न हु"},
    {"image": "assets/gallery/image11.jpg", "caption": "आहुतियों के साथ आरम्भ हुआ यज्ञ जिसमें श्री रामायण वैदिक एजुकेशन फाउंडेशन परिवार द्वारा सक्रिय रूप से भाग लिया हैं"},
    {"image": "assets/gallery/image12.jpg", "caption": "संस्थान की निर्माण के समय का चित्र"},
    {"image": "assets/gallery/image13.jpg", "caption": "संस्थान की निर्माण के समय का चित्र"},
    {"image": "assets/gallery/image14.jpg", "caption": "कावड़िया श्री शिवजी के दर्शन योगी रामायण वैदिक शिक्षा द्वार रात्रि प्रबोधन कर दे"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.pink.shade50,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "📸 चित्रमाला",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "हमारे फाउंडेशन की झलकियां और पवित्र क्षण",
            style: TextStyle(fontSize: 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // 🔹 Main Carousel with captions
          cs.CarouselSlider(
            items: galleryItems.map((item) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item["caption"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
            options: cs.CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),

          const SizedBox(height: 16),

          // 🔹 Scrollable Thumbnails (ListView.builder)
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: galleryItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _current == index
                            ? Colors.green
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        galleryItems[index]["image"]!,
                        height: 80,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
