import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/community_screen.dart';
import '../screens/shop_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // Danh sách các màn hình chính
  final List<Widget> _screens = [
    const HomeScreen(),
    const CommunityScreen(),
    const ShopScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Cộng đồng'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cửa hàng'),
        ],
      ),
    );
  }
}