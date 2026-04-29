import 'package:flutter/material.dart';
import 'package:flutter_application/front/screens/home_screen.dart'; 
import 'package:flutter_application/front/screens/task_screen.dart';
import 'package:flutter_application/front/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

// =========================
// DEMO PAGE (STATEFUL)
// =========================
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _currentIndex = 0;

  // =========================
  // DATA
  // =========================
  final List<Map<String, String>> members = [
    {"name": "Phạm Ngọc Vũ", "msv": "23010192"},
    {"name": "Nguyễn Hoàng Thiên", "msv": "23010139"},
    {"name": "Trần Mạnh Hoàng", "msv": "23010290"},
  ];

  Map<String, dynamic> users = {
    "name": "Phạm Ngọc Vũ",
    "email": "vuph@gmail.com",
    "exp": 120,
    "level": 2,
  };

  List<Map<String, dynamic>> tasks = [
    {
      "title": "Hoc Flutter",
      "difficulty": "easy",
      "expReward": 50,
      "isCompleted": false,
    }
  ];

  // =========================
  // LEVEL UP
  // =========================
  void checkLevelUp() {
    if (users['exp'] >= 200) {
      users['level'] += 1;
      users['exp'] = 0;
    }
  }

  // =========================
  // TASK TAB
  // =========================
  Widget taskTab() {
    return ListView(
      children: tasks.map((t) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(t['title']),
            subtitle: Text(t['difficulty']),
            trailing: t['isCompleted']
                ? const Icon(Icons.check, color: Colors.green)
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        t['isCompleted'] = true;
                        users['exp'] += t['expReward'];
                        checkLevelUp();
                      });
                    },
                    child: const Text("DONE"),
                  ),
          ),
        );
      }).toList(),
    );
  }

  // =========================
  // PROFILE TAB
  // =========================
  Widget profileTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 60),
          Text(users['name'], style: const TextStyle(fontSize: 18)),
          Text(users['email']),
          Text("Level: ${users['level']}"),
        ],
      ),
    );
  }

  // =========================
  // BUILD (DUY NHẤT 1 HÀM BUILD TẠI ĐÂY)
  // =========================
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const HomeScreen(), // <--- Đã gọi đúng file home_screen.dart
      taskTab(),
      profileTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Life RPG"),
      ),
      body: tabs[_currentIndex],

      // 👇 TASKBAR ĐIỀU HƯỚNG
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}