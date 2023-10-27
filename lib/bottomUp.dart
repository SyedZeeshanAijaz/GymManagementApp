import 'package:flutter/material.dart';
import 'package:project/MemberScreen.dart';
import 'package:project/controllers/supabase_controller.dart';
import 'home.dart';

Widget buildBottomSheet(BuildContext context) {
  return const LoginForm();
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '', pass = '';
  //String text = 'Admin';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: TextField(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
//----------------------------------------------------
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: TextField(
                obscureText: true,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
                onChanged: (value) {
                  pass = value;
                }, //----------------------------------------------------------
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (text == 'Admin') {
                  //print('in admin');
                  bool success =
                      await SupabaseController.instance.login(email, pass);
                  if (success) {
                    Navigator.pushReplacementNamed(context, '/admin');
                  } else {
                    print('error');
                    // smjh gya?
                    //yess, aur ek scaffold wali cheez thee wait
                  }
                } else if (text == 'Member') {
                  print('in member');
                  bool success =
                      await SupabaseController.instance.loginMem(email, pass);
                  if (success) {
                    final mem = await SupabaseController.instance
                        .getSpecificData(email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemberScreen(member: mem),
                      ),
                    );
                  } else {
                    print('error');
                    // smjh gya?
                    //yess, aur ek scaffold wali cheez thee wait
                  }
                }
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
