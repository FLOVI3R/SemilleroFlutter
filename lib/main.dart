import 'package:flutter/material.dart';
import 'package:semillero/pages/admin/admin_dashboard.dart';
import 'package:semillero/pages/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: register(),
    );
  }

  
}
