import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Profile"),
          centerTitle: false,
        ),
        body: Center(
          child: Profile(
            imageUrl:
                "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
            name: "Jordan Parker",
            website: "PhoneTaxx.com",
            designation: "Project Manager | Flutter & iOS Developer",
            email: "jordan2021parker@gmail.com",
            phone_number: "18524152144",
          ),
        ));
  }
}
