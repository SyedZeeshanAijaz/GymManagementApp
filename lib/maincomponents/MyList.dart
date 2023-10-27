import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/MemberInfo.dart';
import 'package:project/updateMember.dart';
import 'package:project/controllers/supabase_controller.dart';

class MyList extends StatefulWidget {
  final List<memberInfo> data;
  final int index;
  const MyList(this.data, this.index);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.green,
            onPressed: ((context) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UpdateMem(
                    widget.data[widget.index].id,
                    widget.data[widget.index].name,
                    widget.data[widget.index].gender,
                    widget.data[widget.index].contact,
                    widget.data[widget.index].package,
                    widget.data[widget.index].Email);
              }));
            }),
            icon: Icons.edit,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: (context) {
              SupabaseController.instance
                  .DeleteMem(widget.data[widget.index].id);
            },
            icon: Icons.delete,
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        color: const Color(0xFF1D1D1D),
        child: ListTile(
          title: Text(
            widget.data[widget.index].name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          subtitle: Text(
            widget.data[widget.index].contact,
            style: (const TextStyle(color: Colors.white, fontSize: 15)),
          ),
          leading: const Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        contentTextStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                        backgroundColor: Colors.white,
                        title: Center(
                          child: Text(widget.data[widget.index].name,
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold)),
                        ),
                        content: SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Phone Number= ${widget.data[widget.index].name}',
                              ),
                              Text(
                                  'Gender= ${widget.data[widget.index].gender}'),
                              Text('IDr= ${widget.data[widget.index].id}'),
                              Text(
                                  'Package= ${widget.data[widget.index].package}'),
                              Text('Email= ${widget.data[widget.index].Email}'),
                            ],
                          ),
                        ),
                      ));
            },
            child: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
