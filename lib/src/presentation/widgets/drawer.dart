import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDateTime = DateTime.now();
    final String accountName = 'User Name'; // You can replace this with a dynamic value.

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onTertiary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            UserAccountsDrawerHeader(
              accountName: Text(accountName),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/user1.jpg'),
              ),
              accountEmail: Text(
                '${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year}\n${currentDateTime.hour}:${currentDateTime.minute}',
                style: const TextStyle(fontSize: 8, color: Colors.black),
              ),
            ),
            const Divider(color: Colors.black),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Implement navigation to the home screen here
              },
            ),
            ListTile(
              leading: const Icon(Icons.radio),
              title: const Text('Radio'),
              onTap: () {
                // Implement navigation to the radio screen here
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () {
                // Implement navigation to the events screen here
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Implement navigation to the settings screen here
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
