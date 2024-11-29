
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_project/carstat/logic/models/user.dart';
import 'package:my_project/carstat/logic/services/authentication/authenication_service.dart';
import 'package:my_project/carstat/profile/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<ProfilePage> {
  User? _user;
  final IAuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final lastLoggedInUserEmail = prefs.getString('currentUser');

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


  void _showLogoutConfirmationDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Do you want to log out?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log Out'),
              onPressed: () async {
                await _authService.logout();
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        actions: [
  TextButton(
    onPressed: _showLogoutConfirmationDialog,
    child: const Text(
      'Log Out',
      style: TextStyle(
        color: Colors.white, // Текст білий
        fontSize: 16, // Опціонально, для покращення вигляду
      ),
    ),
  ),
],

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
