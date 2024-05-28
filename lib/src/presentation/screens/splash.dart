import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/screens/auth.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 24, 22),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/logo2.png', width: 250, height: 250),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('GO',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 12, 77, 162))),
              SizedBox(width: 10),
              Text('Live',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 254, 193, 42))),
            ],
          ),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 240,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                top: 0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AuthScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 218, 147),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.fromLTRB(65, 27, 65, 27),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text('Get Started',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
