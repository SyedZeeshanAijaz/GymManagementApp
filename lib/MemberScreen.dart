import 'package:flutter/material.dart';
import 'package:project/MemberInfo.dart';
//import 'package:project/controllers/supabase_controller.dart';
import 'package:project/updateMember.dart';

var color = Colors.grey[800];

class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key, required this.member}) : super(key: key);

  final memberInfo member;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: const Color(0xFF1D1D1D),
                child: ListTile(
                  title: Text(
                    'NAME:  ${member.name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),
            Container(
                //margin: const EdgeInsets.only(bottom: 10),
                color: const Color(0xFF1D1D1D),
                child: ListTile(
                  title: Text(
                    'CONTACT:  ${member.contact}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),

            // ),
            Container(
                // margin: const EdgeInsets.only(bottom: 10),
                color: const Color(0xFF1D1D1D),
                child: ListTile(
                  title: Text(
                    'GENDER:  ${member.gender}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),

            Container(
                // margin: const EdgeInsets.only(bottom: 10),
                color: const Color(0xFF1D1D1D),
                child: ListTile(
                  title: Text(
                    'ID: ${member.id.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),

            Container(
                margin: const EdgeInsets.only(bottom: 10),
                color: const Color(0xFF1D1D1D),
                child: ListTile(
                  title: Text(
                    'PACKAGE:  ${member.package}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF008578),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 50)),
              child: const Text(
                'UPDATE',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpdateMem(member.id, member.name, member.gender,
                      member.contact, member.package, member.Email);
                }));
              },
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF008578),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(250, 50)),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
          ],
        ));
  }
}

class CusContainer extends StatelessWidget {
  final String? text;
  const CusContainer({this.text});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
