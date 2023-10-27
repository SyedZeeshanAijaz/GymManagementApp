import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_18vkvya1.json',
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFF008578),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text(
                    'Register Member',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/regMem');
                  },
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF008578),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(250, 50)),
                  child: const Text(
                    'Search Member',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchMem');
                  },
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF008578),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(250, 50)),
                  child: const Text(
                    'Register Trainer',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/regTrainer');
                  },
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF008578),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(250, 50)),
                  child: const Text(
                    'Search Trainer',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchTrainer');
                  },
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF008578),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(250, 50)),
                  child: const Text(
                    'Attendance',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/attendanceMember');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
