
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/widgets/drawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:srm_live/src/presentation/screens/notification.dart';
import 'package:srm_live/src/presentation/widgets/tiles/radio_home.dart';
import 'package:srm_live/src/presentation/widgets/tiles/rec_tile_home.dart';
import 'package:srm_live/src/presentation/widgets/tiles/squar_tile_home.dart';
import 'package:srm_live/src/presentation/widgets/shimmer_shapes/shimmer_rectangle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.secondaryContainer),
            onPressed: () {
              Navigator.push(
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
        backgroundColor: Colors.transparent,//between color
        color: Theme.of(context).colorScheme.tertiary,
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
                child: _isLoading
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ShimmerRectangle(
                          width: 160,
                          height: 100,
                          baseColor: Theme.of(context).colorScheme.background,
                          highlightColor: Colors.grey[900]!,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: 10),
                        ShimmerRectangle(
                          width: 160,
                          height: 100,
                          baseColor: Theme.of(context).colorScheme.background,
                          highlightColor: Colors.grey[900]!,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: 10),
                        ShimmerRectangle(
                          width: 160,
                          height: 100,
                          baseColor: Theme.of(context).colorScheme.background,
                          highlightColor: Colors.grey[900]!,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        const SizedBox(width: 10),
                        ShimmerRectangle(
                          width: 160,
                          height: 100,
                          baseColor: Theme.of(context).colorScheme.background,
                          highlightColor: Colors.grey[900]!,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    )
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
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
              _isLoading ? ShimmerRectangle(width: double.infinity, height: 160, baseColor: Theme.of(context).colorScheme.background, highlightColor: Colors.grey[900]!, borderRadius: BorderRadius.circular(10)):
                RectTile(title: 'Rectangle 1', icon: Icons.info, color: const Color.fromARGB(255, 110,163,240)),
              const SizedBox(height: 20),
              _isLoading ? ShimmerRectangle(width: double.infinity, height: 80, baseColor: Theme.of(context).colorScheme.background, highlightColor: Colors.grey[900]!, borderRadius: BorderRadius.circular(10)): RadioTile(),
            ],
          ),
        ),
      ),
    );
  }
}
