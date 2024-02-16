import 'package:demoapp/configs/colors.dart';
import 'package:demoapp/models/global_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final bool showBackButton;
  final Widget body;
  const AppScaffold(this.title, this.showBackButton,
      {required this.body, super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  List<MenuItem> menuItems = [
    MenuItem(title: "Home", path: "/home"),
    MenuItem(title: "Wifi Details", path: "/wifi"),
    MenuItem(title: "Calendar", path: "/calendar"),
    MenuItem(title: "Speed Test", path: "/internet"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: widget.showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => context.go('/home'),
              )
            : null,
        actions: <Widget> [
          IconButton(onPressed: () => (), icon: const Icon(Icons.notifications))
        ],
      ),
      body: widget.body,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: null,
            ),
            for (var menuItem in menuItems)
              ListTile(
                title: Text(menuItem.title, style: const TextStyle(
                  color: AppColors.blackTextColor 
                )),
                onTap: () {
                  // Update the state of the app.
                  context.go(menuItem.path);
                },
              ),
          ],
        ),
      ),
    );
  }
}
