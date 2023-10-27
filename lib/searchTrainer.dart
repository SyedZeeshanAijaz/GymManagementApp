import 'package:flutter/material.dart';
import 'package:project/admin.dart';
import 'package:project/controllers/supabase_controller.dart';
import 'searchResult.dart';

class SearchTrainer extends StatefulWidget {
  @override
  State<SearchTrainer> createState() => _SearchTrainerState();
}

class _SearchTrainerState extends State<SearchTrainer> {
  int _counter = 0;

  //SearchNames();
  // Future<List> names2 = SupabaseController.instance.SearchNames();
  // List list = await names2 ;
  // Future<void> FetchNames() async {
  //   final  res1 = await Supabase.client.from(adminTable).select('Name');
  // }
  // final List names = ['umer', 'zeeshan', '3'];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List names2 = [];
  void func() async {
    final x = await SupabaseController.instance.SearchTrainerNames();
    names2 = x
        .map(
          (e) => e['Name'],
        )
        .toList();

    setState(() {});
  }

  List suggestion = [];
  List names3 = [];
  void func2(String a) async {
    final y = await SupabaseController.instance.members_under_trainer(a);
    suggestion = y
        .map(
          (e) => e['Name'],
        )
        .toList();

    setState(() {
      names3 = suggestion;
    });
  }

  TextEditingController seachController = TextEditingController();

  String? search = '';

  @override
  void initState() {
    func();
    // func2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900], //Color(0x77773F3F3F),
          listTileTheme: const ListTileThemeData(
            textColor: Colors.white,
          ),
          textTheme: const TextTheme(
              bodyText2: TextStyle(
            fontSize: 34.0,
            color: Colors.white54,
            //fontFamily: 'Hind'),
          ))),
      home: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: TextField(
                  controller: seachController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: Colors.white54,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      )
                      // fillColor:
                      ),
                  onChanged: (String? value) {
                    setState(() {
                      search = value;
                    });
                  }),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: names2.length,
                    itemBuilder: (Context, index) {
                      //
                      //print('inside itembuilder');
                      String position = names2[index];
                      // print(position);
                      // print('inside');
                      // print(names2[0]);
                      if (seachController.text.isEmpty) {
                        return ListTile(
                            title: Text(names2[index]),
                            onTap: () {
                              func2(names2[index]);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      backgroundColor: Colors.white,
                                      // title: Text(widget.data[widget.index].name),
                                      content: SizedBox(
                                        height: 250,
                                        width: 150,
                                        child: ListView.builder(
                                            itemCount: names3.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                title: Text(names3[index]),
                                              );
                                            }),
                                      )));

                              //ListView.
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //       return Admin();//return SearchResult(position);
                              //     }));
                            });
                      } else if (position
                          .toLowerCase()
                          .contains(seachController.text.toLowerCase())) {
                        return ListTile(
                            title: Text(position),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Admin();
                                // return SearchResult(position);
                              }));
                            });
                      } else {
                        return Container();
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
