import 'package:flutter/material.dart'; // THIẾU DÒNG NÀY SẼ GÂY RA TẤT CẢ LỖI TRÊN
import 'screens/login_screen.dart';   // Import file điều hướng của bạn

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        useMaterial3: true
      ),
      // Mở màn hình Login khi khởi chạy
      home: const LoginScreen(), 
    );
  }
}