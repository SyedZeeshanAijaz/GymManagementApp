import 'package:flutter/material.dart';
import 'package:project/controllers/supabase_controller.dart';
import 'MemberInfo.dart';

String? con;
String? gender;
String? pakg;
String? name;
String? email;

int? count;

class RegisterTrainer extends StatefulWidget {
  const RegisterTrainer({Key? key}) : super(key: key);

  @override
  State<RegisterTrainer> createState() => _RegisterTrainerState();
}

class _RegisterTrainerState extends State<RegisterTrainer> {
  final selected = TextEditingController();
  String? selectedName = 'anas';
  String contact = 'Contact';
  String gen = 'Gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 45.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                          size: 25,
                        ),
                      ),
                      TextForm(
                        'Email',
                        const Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      TextForm(
                        contact,
                        const Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      TextForm(
                        gen,
                        const Icon(
                          Icons.male,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      TextForm(
                        'Package',
                        const Icon(
                          Icons.sports_gymnastics,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),

                Center(
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
                            'REGISTER',
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    onTap: () async {
                      // print('Yes, this is what you are looking for');
                      // print(name.toString());
                      await SupabaseController.instance
                          .RegTrainer(name!, gender!, con!, pakg!, email!);
                      //print('Names sent to DB!/n');
                      Navigator.pushNamed(context, '/admin');
                    },
                  ),
                ),

                // SizedBox(height: 2.0),

//ThemeData(
                //data: Theme.of(context).copyWith(
                //   canvasColor: Colors.blue.shade200,
                //margin: EdgeInsets.only(top: 20),
                //color: Colors.grey,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
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
    );
  }
}

class TextForm extends StatelessWidget {
  TextForm(this.label, this.labelIcon);
  final String label;
  final Icon labelIcon;
  //
  // @override
  // State<textForm> createState() => _textFormState();

//
// class _textFormState extends State<textForm> {
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
              fontSize: 25.0,
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
            // setState(() {
            //   value = contactController.toString();
            //   print('HELLLLOOOOOO $value');
            // });
            //  if(label=)
            if (label == 'Contact') {
              con = contactController.text;
              //print('Here is the value being stored /n');
              //print(con);
            } else if (label == 'Gender') {
              gender = contactController.text;
              //print(gender);
            } else if (label == 'Package') {
              pakg = contactController.text;
              //print(pakg);
            } else if (label == 'Name') {
              name = contactController.text;
              // print('Checking!');
              //print(name);
            } else if (label == 'Email') {
              email = contactController.text;
              // print('Checking!');
              //print(name);
            }

            // validator: (String? value) {
            //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            //},
          }),
    );
  }
}
