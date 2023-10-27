import 'package:flutter/material.dart';
import 'package:project/controllers/supabase_controller.dart';
import 'MemberInfo.dart';
//import 'RegisterMember.dart';
import 'main.dart';

const double iconSize = 25;
//String? noo='3';
//c,g,p;
int? i;
String? n, c, g, p, e;
String pass = 'a';

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: const TextField(
        style: TextStyle(color: Colors.white54),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
        ),
//--
      ),
    );
  }
}

class UpdateMem extends StatelessWidget {
  UpdateMem(this.id, this.namee, this.gender, this.contact, this.package,
      this.Email) {
    i = id;
    n = namee;
    g = gender;
    c = contact;
    p = package;
    e = Email;
  }
  int? id;
  String? namee;
  String? gender;
  String? contact;
  String? package;
  String? Email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 45.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
//color: Colors.grey,
                  child: Column(
                    children: [
                      TextForm(
                        'Name',
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: iconSize,
                        ),
// namee,
// contact,
// gender,
// package
                      ),
                      TextForm(
                        'Email',
                        const Icon(
                          Icons.email,
                          color: Colors.white,
                          size: iconSize,
                        ),
// namee,
// contact,
// gender,
// package
                      ),
                      TextForm(
                        'Contact',
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: iconSize,
                        ),
// namee,
// contact,
// gender,
// package
                      ),
                      TextForm(
                        'Gender',
                        const Icon(
                          Icons.male,
                          color: Colors.white,
                          size: iconSize,
                        ),
// namee,
// contact,
// gender,
// package
                      ),
                      TextForm(
                        'Package',
                        const Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white,
                          size: iconSize,
                        ),
// namee,
// contact,
// gender,
// package
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
// final a = memberInfo(
//   name.toString(),
//   con.toString(),
//   gender.toString(),
//   pakg.toString(),
// );
                    Navigator.pushNamed(context, '/regMem');
                  },
                  child: Center(
                    child: GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.only(top: 60.0),
                          width: 250,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF008578),
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              'UPDATE',
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      onTap: () async {
                        await SupabaseController.instance
                            .UpdateMem(id!, n!, g!, c!, p!, e!, pass!);

                        print('Names sent to DB!/n');

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

// SizedBox(height: 2.0),

//ThemeData(
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  TextForm(this.label, this.labelIcon); //,this.n,this.g,this.c,this.p);
  final String label;
  final Icon labelIcon;

  TextEditingController contactController = TextEditingController();
//String check;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
          controller: contactController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 40.0),
            labelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white54),
            ),

            icon: labelIcon,
//hintText: 'What do people call you?',
            labelText: label, //recieving in constructor
          ),
//
//  if(label=='Gender'){}
          onChanged: (value) {
//  if(label=)
            if (label == 'Contact') {
              c = contactController.text;
              print('Here is the value being stored /n');
//  print(con);
            } else if (label == 'Gender') {
              g = contactController.text;
              print(g);
            } else if (label == 'Package') {
              p = contactController.text;
              print(p);
            } else if (label == 'Name') {
              n = contactController.text;
              print('Checking!');
//  print(name);
            } else if (label == 'Email') {
              e = contactController.text;
              print('Checking!');
//  print(name);
            } else if (label == 'Password') {
              pass = contactController.text;
              print('Checking!');
//  print(name);
            }

// validator: (String? value) {
//   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
//},
          }),
    );
  }
}
