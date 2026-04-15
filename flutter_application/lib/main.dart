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

class DemoPage extends StatelessWidget {
    const DemoPage({super.key});

      // =========================
        // 👥 THÀNH VIÊN NHÓM
          // =========================
            final List<Map<String, String>> members = const [
                {
                      "name": "Phạm Ngọc Vũ",
                            "msv": "23010192",
                                },
                                    {
                                          "name": "Nguyễn Hoàng Thiên",
                                                "msv": "23010139",
                                                    },
                                                        {
                                                              "name": "Trần Mạnh Hoàng",
                                                                    "msv": "23010290",
                                                                        },
                                                                          ];
                                                                          
}
  // =========================
  // USERS
  // =========================
  final Map<String, dynamic> users = const {
    "userId": "U01",
    "name": "Phạm Ngọc Vũ",
    "email": "vuph@gmail.com",
    "exp": 120,
    "level": 2,
    "avatar": "avatar.png",
    "createdAt": "2026-04-15",
  };

  // =========================
  // TASKS
  // =========================
  final List<Map<String, dynamic>> tasks = const [
    {
      "taskId": "T01",
      "userId": "U01",
      "title": "Hoc Flutter",
      "description": "UI basic",
      "difficulty": "easy",
      "expReward": 50,
      "isCompleted": true,
      "createdAt": "2026-04-15",
      "completedAt": "2026-04-15",
    }
  ];

  // =========================
  // FRIENDS
  // =========================
  final List<Map<String, dynamic>> friends = const [
    {
      "userId": "U01",
      "friendId": "U02",
      "status": "accepted",
      "createdAt": "2026-04-10",
    }
  ];

  // =========================
  // ACTIVITIES
  // =========================
  final List<Map<String, dynamic>> activities = const [
    {
      "activityId": "A01",
      "userId": "U01",
      "type": "task_completed",
      "content": "Completed task Hoc Flutter",
      "timestamp": "2026-04-15",
    }
  ];

  // =========================
  // CHALLENGES
  // =========================
  final List<Map<String, dynamic>> challenges = const [
    {
      "challengeId": "C01",
      "title": "7-day streak",
      "goal": 7,
      "reward": 500,
    }
  ];

  // =========================
  // USER CHALLENGES
  // =========================
  final List<Map<String, dynamic>> userChallenges = const [
    {
      "userId": "U01",
      "challengeId": "C01",
      "progress": 3,
      "isCompleted": false,
    }
  ];

  // =========================
  // UI STYLE
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Life RPG - Firestore Demo"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),

            // =========================
            // 👥 THÀNH VIÊN NHÓM
            // =========================
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
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),

                  ...members.asMap().entries.map((e) {
                    int i = e.key;
                    var m = e.value;

                    List<Color> colors = [
                      Colors.red,
                      Colors.green,
                      Colors.blue,
                    ];

                    return Text(
                      "${m['name']} - ${m['msv']}",
                      style: TextStyle(
                        fontSize: 13,
                        color: colors[i],
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            // ================= USERS =================
            rowItem(
              Colors.red,
              Icons.person,
              "USERS: ${users['name']} | ${users['email']} | EXP ${users['exp']} | LV ${users['level']} | ${users['createdAt']}",
            ),

            // ================= TASKS =================
            ...tasks.map((t) => rowItem(
                  Colors.green,
                  Icons.task,
                  "TASK: ${t['title']} | ${t['difficulty']} | EXP ${t['expReward']} | Done ${t['isCompleted']}",
                )),

            // ================= FRIENDS =================
            ...friends.map((f) => rowItem(
                  Colors.blue,
                  Icons.group,
                  "FRIEND: ${f['userId']} → ${f['friendId']} | ${f['status']}",
                )),

            // ================= ACTIVITIES =================
            ...activities.map((a) => rowItem(
                  Colors.orange,
                  Icons.flash_on,
                  "ACTIVITY: ${a['type']} | ${a['content']}",
                )),

            // ================= CHALLENGES =================
            ...challenges.map((c) => rowItem(
                  Colors.purple,
                  Icons.emoji_events,
                  "CHALLENGE: ${c['title']} | Goal ${c['goal']} | Reward ${c['reward']}",
                )),

            // ================= USER CHALLENGES =================
            ...userChallenges.map((uc) => rowItem(
                  Colors.teal,
                  Icons.flag,
                  "USER CHALLENGE: ${uc['userId']} | ${uc['challengeId']} | ${uc['progress']}",
                )),
          ],
        ),
      ),
    );
  }
}