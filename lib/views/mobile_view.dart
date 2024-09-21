import 'package:flutter/material.dart';
import 'package:novel_app/Pages/content_novel.dart';  // Import the ContentNovel widget
import 'package:novel_app/Pages/library.dart';  // Import the LibraryPage widget
import 'package:novel_app/Pages/setting.dart';  // Import the SettingsPage widget

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ContentNovel(),
    LibraryPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E3E3E),
      appBar: AppBar(
        title: Text(
          'Novelku',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4F4F4F),
        foregroundColor: Colors.white,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF4F4F4F),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
