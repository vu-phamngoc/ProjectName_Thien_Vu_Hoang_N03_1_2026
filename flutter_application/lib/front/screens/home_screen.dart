import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // =========================
  // DATA (Dữ liệu mẫu)
  // =========================
  final List<Map<String, String>> members = const [
    {"name": "Phạm Ngọc Vũ", "msv": "23010192"},
    {"name": "Nguyễn Hoàng Thiên", "msv": "23010139"},
    {"name": "Trần Mạnh Hoàng", "msv": "23010290"},
  ];

  final Map<String, dynamic> users = const {
    "name": "Phạm Ngọc Vũ",
    "email": "vuph@gmail.com",
    "exp": 120,
    "level": 2,
  };

  // =========================
  // UI COMPONENT (Helper Widget)
  // =========================
  Widget _buildRowItem(Color color, IconData icon, String text) {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),

          // 👥 THÀNH VIÊN NHÓM
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
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
                const SizedBox(height: 8),
                ...members.asMap().entries.map((e) {
                  int i = e.key;
                  var m = e.value;
                  List<Color> colors = [Colors.red, Colors.green, Colors.blue];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "${m['name']} - ${m['msv']}",
                      style: TextStyle(
                        color: colors[i % colors.length],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🖼️ ẢNH AVATAR VÀ THÔNG TIN USER
          Center(
            child: Column(
              children: [
                // Ảnh đại diện bo tròn
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // Bo góc 50 để tạo hình tròn
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Khung thông tin User phong cách Game
                _buildRowItem(
                  Colors.orange, // Dùng màu cam cho nổi bật
                  Icons.stars, 
                  "Hiệp sĩ: ${users['name']} | LV: ${users['level']} | EXP: ${users['exp']}"
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}