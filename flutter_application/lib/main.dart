import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking',
      debugShowCheckedModeBanner: false, // Tắt biểu tượng debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Danh sách thành viên nhóm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Danh sách thông tin thành viên để quản lý dễ hơn
  final List<Map<String, String>> members = [
    {"name": "Phạm Ngọc Vũ", "msv": "23010192"},
    {"name": "Nguyễn Hoàng Thiên", "msv": "23010139"},
    {"name": "Trần Mạnh Hoàng", "msv": "23010290"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.group, size: 50, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Thành viên nhóm:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Sử dụng map để duyệt qua danh sách và hiển thị
            ...members.map((member) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '${member['name']} - ${member['msv']}',
                style: const TextStyle(fontSize: 16),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}