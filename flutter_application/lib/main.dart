import 'package:flutter/material.dart';
import 'package:flutter_application/front/screens/home_screen.dart';
import 'package:flutter_application/front/screens/profile_screen.dart';
import 'package:flutter_application/front/screens/login_screen.dart';

void main() {
  runApp(const UngDung());
}

class UngDung extends StatelessWidget {
  const UngDung({super.key});

  @override
  Widget build(BuildContext nguCanh) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrangGiaoDien(),
    );
  }
}

class TrangGiaoDien extends StatefulWidget {
  const TrangGiaoDien({super.key});

  @override
  State<TrangGiaoDien> createState() => _TrangGiaoDienState();
}

class _TrangGiaoDienState extends State<TrangGiaoDien> {
  int _chiSoHienTai = 0;

  Widget _tabGioiThieu() {
    return const Center(
      child: Text('About', style: TextStyle(fontSize: 24)),
    );
  }

  Widget _tabLienHe() {
    return const Center(
      child: Text('Contact', style: TextStyle(fontSize: 24)),
    );
  }

  @override
  Widget build(BuildContext nguCanh) {
    List<Widget> danhSachTab = [
      const HomeScreen(),
      _tabGioiThieu(),
      _tabLienHe(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Life RPG"),
      ),
      body: danhSachTab[_chiSoHienTai],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _chiSoHienTai,
        onTap: (chiSo) {
          setState(() {
            _chiSoHienTai = chiSo;
          });
        },
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}