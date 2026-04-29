import 'package:flutter/material.dart';

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
  // UI COMPONENT
  // =========================
  Widget rowItem(Color color, IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================
  // HOME TAB
  // =========================
  Widget homeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),

          // 👥 THÀNH VIÊN
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "THÀNH VIÊN NHÓM",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ...members.asMap().entries.map((e) {
                  int i = e.key;
                  var m = e.value;
                  List<Color> colors = [Colors.red, Colors.green, Colors.blue];
                  return Text(
                    "${m['name']} - ${m['msv']}",
                    style: TextStyle(
                      color: colors[i % colors.length],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          rowItem(Colors.red, Icons.person,
              "USER: ${users['name']} | ${users['email']} | EXP ${users['exp']} | LV ${users['level']}"),
        ],
      ),
    );
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
  // BUILD
  // =========================
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      homeTab(),
      taskTab(),
      profileTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Life RPG"),
      ),
      body: tabs[_currentIndex],

      // 👇 TASKBAR
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
