import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/updateMember.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project/controllers/supabase_controller.dart';

import 'MemberInfo.dart';

int? id;

class attendance extends StatefulWidget {
  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  TextEditingController seachController = TextEditingController();
  String? search = '';
  bool? check = false;
  List<memberInfo> data = [];

  final List<String> names = [
    'a',
    'n',
    'a',
  ];

  @override
  void initState() {
    // func();
    getAttData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SafeArea(
            child: TextField(
                controller: seachController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.grey[200],
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
                  itemCount: data.length,
                  itemBuilder: (Context, index) {
                    String position = data[index].name;
                    // print(position);
                    if (seachController.text.isEmpty) {
                      return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          //dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) {
                                SupabaseController.instance
                                    .DeleteMem(data[index].id);
                                setState(() {
                                  getAttData();
                                });
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UpdateMem(
                                      data[index].id,
                                      data[index].name,
                                      data[index].gender,
                                      data[index].contact,
                                      data[index].package,
                                      data[index].Email);
                                }));
                              }, //new page},
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.update,
                              label: 'update',
                            ),
                          ],
                        ),

                        child: ListTile(
                          dense: true,
                          title: Text(
                            data[index].name,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          //-------paid variable
                          trailing: const Text(
                            'paid',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    } else if (position
                        .toLowerCase()
                        .contains(seachController.text.toLowerCase())) {
                      return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          //dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) {
                                SupabaseController.instance
                                    .DeleteMem(data[index].id);
                                setState(() {
                                  getAttData();
                                });
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                //Navigator.pushNamed(context, '/updateMem');
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UpdateMem(
                                      data[index].id,
                                      data[index].name,
                                      data[index].gender,
                                      data[index].contact,
                                      data[index].package,
                                      data[index].Email);
                                }));
                              }, //new page},
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.update,
                              label: 'update',
                            ),
                          ],
                        ),

                        child: ListTile(
                          dense: true,
                          title: Text(
                            data[index].name,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          //-------paid variable
                          trailing: const Text(
                            'paid',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })),

          //SizedBox(height: 20),
          // ElevatedButton(onPressed: onPressed, child: child)
        ],
      ),
    );
  }

  Future<void> getAttData() async {
    // final today = DateTime.now().toDateCol;
    // final feeCol = today.substring(today.indexOf('_')+1);

    final List x = await Supabase.instance.client
        .from('Members')
        .select('id, Name, Contact, Gender,Package,Email');
    //print(x);
    data = x
        .map(
          (e) => memberInfo.fromMap(e),
        )
        .toList();

    if (mounted) setState(() {});
  }
}
