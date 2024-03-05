import 'package:flutter/material.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(                       //รอให้ทำการเชื่อมต่อไฟร์เบสเสร็จ
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING')?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home: IntroScreen(),
      home: show ? IntroScreen() : HomeScreen(), //show = ตัวแปร, กดปุ่ม Done จะไปหน้า HomeScreen
    );
  }
}

