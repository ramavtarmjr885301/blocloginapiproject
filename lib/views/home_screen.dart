import 'package:blocloginapiproject/custom_aap_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: CustomAppBar(title: 'Home Screen'),
body: Center(
  child: Text("Home SCreeen"),
),

    );
  }
}