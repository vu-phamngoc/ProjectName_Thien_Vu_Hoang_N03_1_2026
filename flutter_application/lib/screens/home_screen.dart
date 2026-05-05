// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nhân vật của con")),
      body: Column(
        children: [
          // Khu vực nhân vật
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue.withOpacity(0.1),
            child: Row(
              children: [
                const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Level 5 - Chiến thần deadline", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text("EXP: 450/500"),
                  ],
                )
              ],
            ),
          ),
          const Expanded(child: Center(child: Text("Danh sách Task đang chờ xử lý..."))),
        ],
      ),
    );
  }
}