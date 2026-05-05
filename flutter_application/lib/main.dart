import 'package:flutter/material.dart'; // THIẾU DÒNG NÀY SẼ GÂY RA TẤT CẢ LỖI TRÊN
import 'screens/main_navigation.dart';   // Import file điều hướng của bạn

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
      // Bỏ 'const' trước MainNavigation nếu bên trong nó có chứa 
      // các biến không phải hằng số (non-constant).
      home: const MainNavigation(), 
    );
  }
}