import 'package:demoapp/component/app_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      "Home",
      false,
      body: SizedBox(
        child: Text(
            "Home",
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
      ),
    );
  }
}
