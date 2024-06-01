import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/widgets/red_live_radio_indicator.dart';

class RadioTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground, // Interior color
        border: Border.all(
          color: Theme.of(context).colorScheme.onTertiary, // Boundary color
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50.0, // Width of the asset space
              height: double.infinity,
              // Replace the placeholder asset with your own asset or icon
              child: Icon(Icons.radio, color: Colors.white),
            ),
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: const [
                  Text(
                    'Radio',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0, // Text size
                    ),
                  ),
                  Text(
                    'Listen to your favorite radio stations',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 12.0, // Text size
                    ),
                  ),
                ],
              ),
             const Positioned(
                top: 12.0, // Position from the top
                 left: 60,// Position from the right
                child: LiveIndicator(), // Red dot indicator
              ),
            ],
          ),
          Expanded(
            child: SizedBox(), // Empty widget to fill remaining space
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25.0, // Radius of the circular button
              backgroundColor: Theme.of(context).colorScheme.onTertiary, // Background color of the circular button
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black, // Icon color
                  size: 35.0, // Icon size
                ),
                onPressed: () {
                  // Handle play button press
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
