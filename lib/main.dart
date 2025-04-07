import 'package:university_event_management_system/screens/login_page.dart';
import 'package:university_event_management_system/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:university_event_management_system/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(), 
        '/signup': (context) => SignupPage(), 
        '/home': (context) =>BottomNavBar(), 
      },
    );
  }
}
