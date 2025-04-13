import 'package:flutter/material.dart';
import 'package:university_event_management_system/screens/home_page.dart';
import 'package:university_event_management_system/screens/filter_screen.dart';
import 'package:university_event_management_system/screens/favorite_screen.dart';
import 'package:university_event_management_system/screens/notification_screen.dart';
import 'package:university_event_management_system/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;


  List<Map<String, String>> favoriteEvents = [];


  void _toggleFavorite(Map<String, String> event) {
    setState(() {
      if (favoriteEvents.contains(event)) {
        favoriteEvents.remove(event); // Remove event from favorites
      } else {
        favoriteEvents.add(event); // Add event to favorites
      }
    });
  }

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();

    _screens.addAll([
      HomePage(favoriteEvents: favoriteEvents, toggleFavorite: _toggleFavorite),
      FilterScreen(),
      FavoriteScreen(favoriteEvents: favoriteEvents),
      NotificationScreen(),
      
      ProfileScreen(),
      
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
