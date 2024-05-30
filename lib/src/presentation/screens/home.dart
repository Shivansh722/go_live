import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/screens/notification.dart';
import 'package:srm_live/src/presentation/widgets/tiles/rec_tile.dart';
import 'package:srm_live/src/presentation/widgets/tiles/squar_tile.dart';
// Import SquareTile

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Events', // Replace with the actual user name
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Horizontal Swipable Tiles
              SizedBox(
                height: 150, // Adjust the height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    SquareTile(title: 'Tile 1', icon: Icons.home, color: Theme.of(context).colorScheme.secondary),
                    SquareTile(title: 'Tile 2', icon: Icons.star, color: Theme.of(context).colorScheme.onSecondary),
                    SquareTile(title: 'Tile 3', icon: Icons.favorite, color: Theme.of(context).colorScheme.surface),
                    SquareTile(title: 'Tile 4', icon: Icons.person, color: Colors.orange),
                    // Add more tiles as needed
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

                  const Spacer(),

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
              // Rectangular Tiles Below
                RectTile(title: 'Rectangle 1', icon: Icons.info, color: Theme.of(context).colorScheme.tertiary), 
              
              // Add more rectangles as needed
            ],
          ),
        ),
      ),
    );
  }
}

