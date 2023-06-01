import 'package:flutter/material.dart';
import 'package:flutter_api/ui/pages/home_page.dart';

import 'create_user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "http \n Muhammad Tegar Heidar Gunawan_1207070080",
        style: TextStyle(color: Colors.black),
      )),
      body: HomePage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateUserScreen()))
            .then((value) => setState(() {})),
      ),
    );
  }
}
