import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottomUp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var text = '';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarGlow(
                endRadius: 100,
                glowColor: Colors.white,
                child: Icon(
                  Icons.sports_gymnastics,
                  size: 100,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 75),
              //Text Hello!
              Text(
                'Hello Again!',
                style: GoogleFonts.bebasNeue(fontSize: 52, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome back, you\' ve been missed!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF008578),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 50),
                ),
                child: const Text(
                  'Admin',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  text = 'Admin';
                  showModalBottomSheet(
                      context: context, builder: buildBottomSheet);
                  //Navigator.pushNamed(context, '/admin');
                },
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF008578),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(250, 50)),
                child: const Text(
                  'Member',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  text = 'Member';
                  showModalBottomSheet(
                      context: context, builder: buildBottomSheet);
                },
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF008578),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(250, 50)),
                child: const Text(
                  'Packages',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/myPackages');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
