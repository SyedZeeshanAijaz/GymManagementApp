import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final String? name;
  final contact ;
  final gender ;
  final pkg='package';

  const SearchResult(this.name,this.contact,this.gender);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Column(
            children: [
              Text(
                name.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                contact.toString(),
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white54,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                gender.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                pkg.toString(),
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white54,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              // GestureDetector(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.teal,
              //     ),
              //
              //     height: 40,
              //     width: 200,
              //     child: Center(
              //       child: Text('Pop Up Sheet',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold
              //             ,color: Colors.white,
              //       ),),
              //     ),
              //   ),
              //   onTap: ()
              //   {
              //     showModalBottomSheet(context: context, builder: buildBottomSheet);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
