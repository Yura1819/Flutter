import 'package:flutter/material.dart';
import 'package:my_project/carstat/profile/screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ScreenProf.padding(context),
      child: Column(
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
            'Name: User Name',
            style: TextStyle(
              fontSize: ScreenProf.fontSize(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Email: user@example.com',
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
      ),
    );
  }
}
