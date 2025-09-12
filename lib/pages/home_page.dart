import 'package:flutter/material.dart';
import '../widgets/contact_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/top_marquee.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/announcement_section.dart';
import '../widgets/workshop_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/donate_info_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final announcementKey = GlobalKey();
  final workshopKey = GlobalKey();
  final galleryKey = GlobalKey();
  final contactKey = GlobalKey();

  String _activeSection = "मुख्य पृष्ठ";

  void scrollToSection(String section) {
    setState(() {
      _activeSection = section;
    });

    BuildContext? targetContext;
    switch (section) {
      case "मुख्य पृष्ठ":
        targetContext = heroKey.currentContext;
        break;
      case "हमारे बारे में":
        targetContext = aboutKey.currentContext;
        break;
      case "घोषणा":
        targetContext = announcementKey.currentContext;
        break;
      case "सनातन कार्यशाला":
        targetContext = workshopKey.currentContext;
        break;
      case "चित्रमाला":
        targetContext = galleryKey.currentContext;
        break;
      case "संपर्क":
        targetContext = contactKey.currentContext;
        break;
      case "दान करें":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DonateInfoPage()),
        );
        return;
    }

    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.orangeAccent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/logo.jpg", height: 50),
                  const SizedBox(height: 10),
                  const Text(
                    "रामायण वैदिक एजुकेशन फाउंडेशन",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            _drawerItem("मुख्य पृष्ठ"),
            _drawerItem("हमारे बारे में"),
            _drawerItem("घोषणा"),
            _drawerItem("सनातन कार्यशाला"),
            _drawerItem("चित्रमाला"),
            _drawerItem("संपर्क"),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  scrollToSection("दान करें");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _activeSection == "दान करें"
                      ? Colors.deepOrange
                      : Colors.orange,
                ),
                child: const Text("दान करें"),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: TopMarquee()),
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: NavBar(
              activeSection: _activeSection,
              onNavTap: scrollToSection,
            ),
          ),
          SliverToBoxAdapter(
            key: heroKey,
            child: HeroSection(
              onAboutTap: () => scrollToSection("हमारे बारे में"),
              onWorkshopTap: () => scrollToSection("सनातन कार्यशाला"),
            ),
          ),
          SliverToBoxAdapter(key: aboutKey, child: const AboutSection()),
          SliverToBoxAdapter(
              key: announcementKey, child: const AnnouncementSection()),
          SliverToBoxAdapter(key: workshopKey, child: const WorkshopSection()),
          SliverToBoxAdapter(key: galleryKey, child: const GallerySection()),
          SliverToBoxAdapter(key: contactKey, child: const ContactSection()),
        ],
      ),
    );
  }

  Widget _drawerItem(String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        scrollToSection(title);
      },
    );
  }
}
