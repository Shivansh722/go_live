import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/widgets/drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:srm_live/src/presentation/screens/notification.dart';
import 'package:srm_live/src/presentation/widgets/tiles/radio_home.dart';
import 'package:srm_live/src/presentation/widgets/tiles/rec_tile_home.dart';
import 'package:srm_live/src/presentation/widgets/tiles/squar_tile_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.secondaryContainer),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
          IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onTertiary,
                  width: 2.0,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/user1.jpg'),
                radius: 18,
              ),
            ),
            onPressed: () {
              // Implement profile viewing logic here
            },
          ),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondaryContainer),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,//between color
        color: Theme.of(context).colorScheme.onBackground,
        buttonBackgroundColor: Theme.of(context).colorScheme.onTertiary,
        height: 50,
        items: const [
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.radio_button_checked, size: 30),
          Icon(Icons.event, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          // Implement navigation to the respective screens here
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Events',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    SquareTile(title: 'Tile 1', icon: Icons.home, color: Theme.of(context).colorScheme.secondary),
                    SquareTile(title: 'Tile 2', icon: Icons.star, color: Theme.of(context).colorScheme.onSecondary),
                    SquareTile(title: 'Tile 3', icon: Icons.favorite, color: Theme.of(context).colorScheme.surface),
                    SquareTile(title: 'Tile 4', icon: Icons.person, color: Colors.orange),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'Registered Spaces',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Implement view all logic here
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RectTile(title: 'Rectangle 1', icon: Icons.info, color: Theme.of(context).colorScheme.tertiary),
              const SizedBox(height: 20),
              RadioTile(),
            ],
          ),
        ),
      ),
    );
  }
}
