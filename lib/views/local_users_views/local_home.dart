// import 'dart:ui';

// import 'package:bloc_practice/barrel.dart';
// import 'package:bloc_practice/data/model/local_user_model.dart';
// import 'package:bloc_practice/views/local_users_views/local_notes_screen.dart';
// import 'package:bloc_practice/views/local_users_views/local_profile_screen.dart';

// import 'package:flutter/material.dart';

// class LocalHome extends StatefulWidget {
//   const LocalHome({super.key});

//   @override
//   State<LocalHome> createState() => _LocalHomeState();
// }

// class _LocalHomeState extends State<LocalHome> {
//   int _currentIndex = 0;


//   late LocalUserModel user;
//   final List<Widget> _tabs = [
//     LocalNotesScreen(),];
    
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: _tabs[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
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
