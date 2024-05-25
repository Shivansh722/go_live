import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/screens/notification.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.secondaryContainer),
          onPressed: () {
           // Implement drawer opening logic here
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.secondaryContainer),
            onPressed: () {
              // Replace 'newRoute' with the actual route you want to navigate to
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NotificationPage()));
            },
          ),
          IconButton(
  icon: Container(
    width: 40, // Adjust the size as needed
    height: 40, // Adjust the size as needed
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Theme.of(context).colorScheme.onTertiary, // Replace with your desired border color
        width: 2.0, // Adjust the border width as needed
      ),
    ),
    child: const CircleAvatar(
      backgroundImage: AssetImage('assets/user1.jpg'), // Replace with the actual profile image URL
      radius: 18, // Adjust the radius to fit inside the border
    ),
  ),
  onPressed: () {
    // Implement profile viewing logic here
  },
),

        ],
      ),
      body:const Center(
       
      ),
    );
  }
}


