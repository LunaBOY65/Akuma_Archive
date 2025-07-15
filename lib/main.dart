import 'package:flutter/material.dart';
import 'Favorites.dart';
import 'settings.dart';

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
      home: MyHomePage(title: 'Devil Fruit'),
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
    return Column(
      children: [
        // Header Section
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // ใช้สีไล่ระดับ (gradient) เพื่อให้ดูสวยขึ้น
            gradient: LinearGradient(
              colors: [Colors.indigo[300]!, Colors.indigo[600]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20), // มุมโค้ง
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          // ใช้ Column เพื่อจัดเรียงข้อความแนวตั้ง
          child: Column(
            children: const [
              Text(
                '🍎 Devil Fruit Collection', // ชื่อหัวข้อ
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8), // เว้นระยะห่าง
              Text(
                'สำรวจพลังลึกลับของผลปีศาจ', // คำอธิบาย
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),

        // Fruits Grid
        Expanded(
          child: GridView.count(
            /// กำหนดค่าต่าง ๆ สำหรับ GridView เช่น จำนวนคอลัมน์, ระยะห่าง, และอัตราส่วนของแต่ละช่อง
            ///
            /// - `crossAxisCount`: จำนวนคอลัมน์ใน GridView (เช่น 2 คอลัมน์)
            /// - `padding`: กำหนดระยะขอบรอบ GridView
            /// - `crossAxisSpacing` และ `mainAxisSpacing`: ระยะห่างระหว่างช่องแนวนอนและแนวตั้ง
            /// - `childAspectRatio`: อัตราส่วนความกว้างต่อความสูงของแต่ละช่อง
            ///
            /// ในแต่ละช่อง จะใช้ Container เพื่อแสดงข้อมูลผลไม้ โดยตกแต่งด้วยสีพื้นขาว, มุมโค้งมน และเงาเบา ๆ
            /// เหมาะสำหรับมือใหม่ที่ต้องการสร้าง GridView ที่ดูสวยงามและอ่านง่าย
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
            children: fruits.map((fruit) {
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
                      //ใช้ Container เมื่อจำเป็นต้องปรับแต่ง หรือจัดวาง widget
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
                      /*ใช้ Padding เฉยๆเพราะ layout ไม่ได้จัดอะไรมาก ใช้แค่จัดระยะขอบรอบนอกเฉยๆ
                      ส่วน Container เอาไว้จัด layout แบบซับซ้อนกว่า*/
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
            }).toList(),
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
