import 'package:flutter/material.dart';
import '../../data/model/local_user_model.dart';
class LocalProfileScreen extends StatelessWidget {
  final LocalUserModel user;
  const LocalProfileScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"),
      centerTitle: true,
      automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, ${user.username}", style: TextStyle(fontSize: 20)),
            Text("Email: ${user.email}"),
             Text("Mobile Number: ${user.mobileNumber}"),
          ],
        ),
      ),
    );
  }
}
