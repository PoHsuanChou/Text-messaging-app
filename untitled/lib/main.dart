import 'package:flutter/material.dart';
import 'package:untitled/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/main_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
