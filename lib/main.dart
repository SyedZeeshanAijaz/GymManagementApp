import 'package:flutter/material.dart';
import 'package:project/controllers/supabase_controller.dart';
import 'bmicalculator/BMImain.dart';
import 'atttendance.dart';
import 'home.dart';
import 'admin.dart';
import 'RegisterMember.dart';
import 'searchList.dart';
import 'searchTrainer.dart';
import 'saadBHAi.dart';
import 'registerTrainer.dart';
import 'packages.dart';

Future<void> main() async {
  await SupabaseController.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: const HomePage(),
      home: HomePage(), //HomePage(),
      routes: {
        '/admin': (context) => const Admin(),
        '/regMem': (context) => const RegisterMember(),
        '/searchMem': (context) => MyApp(),
        '/attendance': (context) => attendance(),
        '/searchTrainer': (context) => SearchTrainer(),
        '/regTrainer': (context) => RegisterTrainer(),
        '/attendanceMember': (context) => AttendanceScreen(),
        '/updateMem': (context) => RegisterMember(),
        '/bmi': (context) => BMICalculator(),
        '/myPackages': (context) => MyPackages(),
      },
    );
  }
}
