import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:university_event_management_system/screens/login_page.dart';
import 'package:university_event_management_system/screens/signup_page.dart';
import 'package:university_event_management_system/widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'UniEvent',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => BottomNavBar(),
      },
    );
  }
}