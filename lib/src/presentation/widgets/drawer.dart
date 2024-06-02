import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDateTime = DateTime.now();
    const String accountName = 'User Name'; // You can replace this with a dynamic value.

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            UserAccountsDrawerHeader(
             decoration: BoxDecoration(
               color: Theme.of(context).colorScheme.background,
              ),
              accountName: Text(accountName, style: TextStyle(color: Colors.grey)),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/user1.jpg'),
              ),
              accountEmail: Text(
                '${currentDateTime.day}/${currentDateTime.month}/${currentDateTime.year}\n${currentDateTime.hour}:${currentDateTime.minute}',
                style: const TextStyle(fontSize: 8, color: Colors.grey),
              ),
            ),
           
            ListTile(
              leading: Icon(Icons.home, color: Theme.of(context).colorScheme.onTertiary),
              title: const Text('Home', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Implement navigation to the home screen here
              },
            ),
            ListTile(
              leading: Icon(Icons.radio, color: Theme.of(context).colorScheme.onTertiary),
              title: const Text('Radio', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Implement navigation to the radio screen here
              },
            ),
            ListTile(
              leading: Icon(Icons.event, color: Theme.of(context).colorScheme.onTertiary),
              title: const Text('Events', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Implement navigation to the events screen here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.onTertiary),
              title: const Text('Settings', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Implement navigation to the settings screen here
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.onTertiary),
              title: const Text('Logout', style: TextStyle(color: Colors.grey)),
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
