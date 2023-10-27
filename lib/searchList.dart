import 'package:flutter/material.dart';
import 'package:project/MemberInfo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project/maincomponents/MyList.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<memberInfo> data = [];
  List<memberInfo> data_2 = [];
  int len = 0;

  final controller = TextEditingController();

  @override
  void initState() {
    getAttData();
    super.initState();
  }

  void searchList(String query) {
    final suggestions = data.where((e) {
      final name = e.name.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();
    setState(() {
      data_2 = suggestions;
      len = data_2.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor:
              const Color(0xFF1D1D1D), //Color(0x77773F3F3F),
          listTileTheme: const ListTileThemeData(
            textColor: Colors.white,
          ),
          textTheme: const TextTheme(
              bodyText2: TextStyle(
            fontSize: 34.0,
            color: Colors.white54,
            //fontFamily: 'Hind'),
          ))),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white),
                    fillColor: const Color(0xFF1D1D1D),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )
                    // fillColor:
                    ),
                onChanged: searchList,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: len,
                  itemBuilder: (context, index) {
                    if (controller.text.isEmpty) {
                      return MyList(data, index);
                    } else {
                      return MyList(data_2, index);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getAttData() async {
    final List x = await Supabase.instance.client
        .from('Members')
        .select('id, Name, Contact, Gender,Package,Email');
    data = x
        .map(
          (e) => memberInfo.fromMap(e),
        )
        .toList();

    if (mounted) {
      setState(() {
        len = data.length;
      });
    }
  }
}
