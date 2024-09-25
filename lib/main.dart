import 'package:character_sheet/components/characterSheetForm.dart';
import 'package:character_sheet/components/sheetform1.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'components/sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Pages for each tab
  static const List<Widget> _pages = <Widget>[
    Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SheetDisplay(
        assetPath: 'lib/assets/baseAC2d20-1.jpg',
        width: 595,
        height: 842,
      ),
    ])),
    Center(child: PersonalForm()),
    Center(child: CharacterSheetForm(onSave: onSave)),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display selected tab content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Needed for more than 3 items
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Fulla Personatge',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Equip/Armes/Talents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ice_skating_outlined),
            label: 'Encanteris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // The currently selected index
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Update the index on tap
      ),
    );
  }

  static onSave(Map<String, dynamic> p1) {
    developer.log("save·");
  }
}
