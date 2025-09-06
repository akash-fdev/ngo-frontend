import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ramayan Vedic Foundation',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto', // tum chaho toh GoogleFonts bhi use kar sakte ho
      ),
      home: const HomePage(),
    );
  }
}
