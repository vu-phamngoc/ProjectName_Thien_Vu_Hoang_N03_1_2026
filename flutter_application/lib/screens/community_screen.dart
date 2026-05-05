// lib/screens/community_screen.dart
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bảng tin gia đình")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.notifications_active, color: Colors.orange),
          title: Text("Sự kiện $index"),
          subtitle: const Text("Con đã hoàn thành task 'Rửa bát'"),
          trailing: const Text("2 phút trước"),
        ),
      ),
    );
  }
}