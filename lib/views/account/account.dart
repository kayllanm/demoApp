import 'package:demoapp/component/app_scaffold.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold("Accounts Page", true, body: Text('Accounts Page'));
  }
}