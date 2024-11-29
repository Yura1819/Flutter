
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_project/carstat/logic/models/user.dart';
import 'package:my_project/carstat/profile/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<ProfilePage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final lastLoggedInUserEmail = prefs.getString('lastLoggedInUser');

    if (lastLoggedInUserEmail != null) {
      final userString = prefs.getString(lastLoggedInUserEmail);
      if (userString != null) {
        final Map<String, dynamic> userMap =
        jsonDecode(userString) as Map<String, dynamic>;
        setState(() {
          _user = User.fromJson(userMap);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: ScreenProf.padding(context),
        child: _user != null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: ScreenProf.avatarRadius(context),
                backgroundImage: const AssetImage(''),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${_user!.name}',
              style: TextStyle(
                fontSize: ScreenProf.fontSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${_user!.email}',
              style: TextStyle(
                fontSize: ScreenProf.fontSize(context),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
            : const Column(),
      ),// Use the separated ProfileBody widget
    );
  }
}
