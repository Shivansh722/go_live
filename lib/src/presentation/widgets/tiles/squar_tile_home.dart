import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

   SquareTile({
    required this.title,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Adjust the width as needed
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          // Text positioned at the top left
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            ),
          ),
          // Icon positioned at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Icon(icon,
               color: Colors.white,
               size: 60 )// Adjust the size as needed),
            ),
          ),
        ],
      ),
    );
  }
}
