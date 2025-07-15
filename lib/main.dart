import 'package:flutter/material.dart';
import 'Favorites.dart';
import 'settings.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo[600]!),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.indigo,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      home: MyHomePage(title: '🍎 Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// MyHomeContent เป็น StatelessWidget ที่ใช้แสดงข้อมูล
//รายการของผลปีศาจแต่ละชนิดในรูปแบบ List ของ Map โดยแต่ละ Map จะมีข้อมูลชื่อ, ประเภท, พลัง, และ emoji
class MyHomeContent extends StatelessWidget {
  final List<Map<String, String>> fruits = [
    {
      'name': 'Gomu Gomu no Mi',
      'type': 'Paramecia',
      'power': 'ยางยืด',
      'emoji': '🍎',
    },
    {'name': 'Mera Mera no Mi', 'type': 'Logia', 'power': 'ไฟ', 'emoji': '🍎'},
    {
      'name': 'Hie Hie no Mi',
      'type': 'Logia',
      'power': 'น้ำแข็ง',
      'emoji': '🍎',
    },
    {
      'name': 'Yami Yami no Mi',
      'type': 'Logia',
      'power': 'ความมืด',
      'emoji': '🍎',
    },
    {
      'name': 'Suna Suna no Mi',
      'type': 'Logia',
      'power': 'ทราย',
      'emoji': '🍎',
    },
    {
      'name': 'Ope Ope no Mi',
      'type': 'Paramecia',
      'power': 'ห้องผ่าตัด',
      'emoji': '🍎',
    },
    {'name': 'Tori Tori no Mi', 'type': 'Zoan', 'power': 'นก', 'emoji': '🍎'},
    {
      'name': 'Uo Uo no Mi',
      'type': 'Mythical Zoan',
      'power': 'มังกร',
      'emoji': '🍎',
    },
    {
      'name': 'Bara Bara no Mi',
      'type': 'Paramecia',
      'power': 'แยกชิ้นส่วน',
      'emoji': '🍎',
    },
  ];

  Color getTypeColor(String type) {
    // สร้างฟังก์ชันเพื่อใช้งานร่วมกับ Widget สำหรับเลือกสีตามประเภทของผลปีศาจ
    /// เช่น Paramecia จะเป็นสีน้ำเงิน, Logia จะเป็นสีเขียว เป็นต้น
    switch (type) {
      case 'Paramecia':
        return Colors.blue;
      case 'Logia':
        return Colors.green;
      case 'Zoan':
        return Colors.orange;
      case 'Mythical Zoan':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Header Section with Background Image
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // รูปพื้นหลัง
                  Image.asset(
                    'assets/home/Background.png',
                    width: double.infinity,
                    height: 150, // กำหนดความสูงตามต้องการ
                    fit: BoxFit.cover,
                  ),

                  // เลเยอร์เบลอ
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.black.withOpacity(
                        0.4,
                      ), // ช่วยให้ข้อความเด่นขึ้น
                    ),
                  ),

                  // ข้อความด้านใน
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        Text(
                          'Devil Fruit Collection',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        // เพิ่ม widgets อื่นได้ตามต้องการ
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ระยะห่างระหว่าง Header และ GridView
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        // Fruits Grid Section
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final fruit = fruits[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Emoji Icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: getTypeColor(fruit['type']!).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          fruit['emoji']!,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Fruit Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        fruit['name']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Type Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: getTypeColor(fruit['type']!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        fruit['type']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: fruits.length),
          ),
        ),
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    MyHomeContent(),
    const Favorites(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body:
          _pages[_selectedIndex], // แก้ไขจาก *pages[*selectedIndex] เป็น _pages[_selectedIndex] ช่วยป้องกันการเข้าถึงจากภายนอกโดยไม่ได้ตั้งใจ
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
