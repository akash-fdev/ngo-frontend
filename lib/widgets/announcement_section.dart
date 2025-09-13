import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({super.key});

  Future<void> _downloadPDF(BuildContext context) async {
    try {
      final dio = Dio();

      // 🔹 Yahan apna local ya hosted PDF URL daalna
      const url = "https://www.africau.edu/images/default/sample.pdf";

      // 🔹 Storage location
      final dir = await getApplicationDocumentsDirectory();
      final filePath = "${dir.path}/admission_form.pdf";

      // 🔹 Download
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            final progress = (count / total * 100).toStringAsFixed(0);
            debugPrint("Download Progress: $progress%");
          }
        },
      );

      // 🔹 File open
      if (context.mounted) {
        await OpenFilex.open(filePath);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ PDF Downloaded & Opened")),
        );
      }
    } catch (e) {
      debugPrint("❌ Download Error: $e");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Failed to download PDF")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF1F8FF),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "📢 घोषणा",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 650,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFAF0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(2, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.orange.shade100,
                    child: const Icon(
                      Icons.campaign,
                      color: Colors.orange,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Admission Form",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "कार्यक्रम की विस्तृत जानकारी के लिए नीचे दिए गए लिंक पर क्लिक करें",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    onPressed: () => _downloadPDF(context),
                    icon: const Icon(Icons.download, color: Colors.white),
                    label: const Text(
                      "PDF डाउनलोड करें",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
