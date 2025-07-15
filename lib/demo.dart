// import 'package:flutter/material.dart';
// import 'Favorites.dart';
// import 'settings.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo[600]!),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.indigo,
//           foregroundColor: Colors.white,
//         ),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Colors.indigo,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.white70,
//         ),
//       ),
//       home: MyHomePage(title: 'Devil Fruit'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class MyHomeContent extends StatelessWidget {
//   final List<Map<String, String>> fruits = [
//     {
//       'name': 'Gomu Gomu no Mi',
//       'type': 'Paramecia',
//       'power': 'ยางยืด',
//       'emoji': '🍎',
//     },
//     {'name': 'Mera Mera no Mi', 'type': 'Logia', 'power': 'ไฟ', 'emoji': '🔥'},
//     {
//       'name': 'Hie Hie no Mi',
//       'type': 'Logia',
//       'power': 'น้ำแข็ง',
//       'emoji': '❄️',
//     },
//     {
//       'name': 'Yami Yami no Mi',
//       'type': 'Logia',
//       'power': 'ความมืด',
//       'emoji': '🌑',
//     },
//     {
//       'name': 'Suna Suna no Mi',
//       'type': 'Logia',
//       'power': 'ทราย',
//       'emoji': '🏜️',
//     },
//     {
//       'name': 'Ope Ope no Mi',
//       'type': 'Paramecia',
//       'power': 'ห้องผ่าตัด',
//       'emoji': '🏥',
//     },
//     {'name': 'Tori Tori no Mi', 'type': 'Zoan', 'power': 'นก', 'emoji': '🦅'},
//     {
//       'name': 'Uo Uo no Mi',
//       'type': 'Mythical Zoan',
//       'power': 'มังกร',
//       'emoji': '🐉',
//     },
//     {
//       'name': 'Bara Bara no Mi',
//       'type': 'Paramecia',
//       'power': 'แยกชิ้นส่วน',
//       'emoji': '🎪',
//     },
//   ];

//   Color getTypeColor(String type) {
//     switch (type) {
//       case 'Paramecia':
//         return Colors.blue;
//       case 'Logia':
//         return Colors.green;
//       case 'Zoan':
//         return Colors.orange;
//       case 'Mythical Zoan':
//         return Colors.purple;
//       default:
//         return Colors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Header Section
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.all(16),
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.indigo[300]!, Colors.indigo[600]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.indigo.withOpacity(0.3),
//                 blurRadius: 10,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: const Column(
//             children: [
//               Text(
//                 '🍎 Devil Fruit Collection',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'สำรวจพลังลึกลับของผลปีศาจ',
//                 style: TextStyle(fontSize: 16, color: Colors.white70),
//               ),
//             ],
//           ),
//         ),

//         // Fruits Grid
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 childAspectRatio: 0.85,
//               ),
//               itemCount: fruits.length,
//               itemBuilder: (context, index) {
//                 final fruit = fruits[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // แสดง Dialog เมื่อกดที่การ์ด
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text(fruit['name']!),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('ประเภท: ${fruit['type']}'),
//                             Text('พลัง: ${fruit['power']}'),
//                             Text('อีโมจิ: ${fruit['emoji']}'),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () => Navigator.pop(context),
//                             child: const Text('ปิด'),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           blurRadius: 8,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         // Emoji Icon
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: getTypeColor(
//                               fruit['type']!,
//                             ).withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Center(
//                             child: Text(
//                               fruit['emoji']!,
//                               style: const TextStyle(fontSize: 30),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 12),

//                         // Fruit Name
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8),
//                           child: Text(
//                             fruit['name']!,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const SizedBox(height: 8),

//                         // Type Badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: getTypeColor(fruit['type']!),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             fruit['type']!,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   final List<Widget> _pages = [
//     MyHomeContent(),
//     const Favorites(),
//     const Settings(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body:
//           _pages[_selectedIndex], // แก้ไขจาก *pages[*selectedIndex] เป็น _pages[_selectedIndex]
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }
