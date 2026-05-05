// lib/screens/shop_screen.dart
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đổi phần thưởng")),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        children: List.generate(4, (index) => Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.card_giftcard, size: 50, color: Colors.redAccent),
              Text("Phần thưởng ${index + 1}"),
              const Text("Cost: 200 Gold", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
            ],
          ),
        )),
      ),
    );
  }
}