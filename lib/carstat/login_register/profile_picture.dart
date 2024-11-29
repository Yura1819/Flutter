import 'package:flutter/material.dart'; 

class ProfilePicture extends StatelessWidget {

  final String imageUrl;

  final double radius;
  
  const ProfilePicture({required this.imageUrl, super.key, this.radius = 50.0});

  @override
  Widget build(BuildContext context) {

    return CircleAvatar(
      radius: radius, 
      
      backgroundImage: NetworkImage(imageUrl), 
    );
  }
}
