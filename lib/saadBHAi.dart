import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

var feeCol;

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<AttendanceData> data = [];

  @override
  void initState() {
    getAttData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // ... other theme values ...

          toggleableActiveColor: Colors.green),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Center(child: const Text('Attendance')),
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, i) {
            return AttendanceTile(data: data[i]);
          },
        ),
      ),
    );
  }

  Future<void> getAttData() async {
    final today = DateTime.now().toDateCol;
    feeCol = today.substring(today.indexOf('_') + 1);

    final List x = await Supabase.instance.client
        .from('Attendance')
        .select('id, Name, $today, $feeCol}');

    data = x
        .map(
          (e) => AttendanceData.fromMap(e, today, feeCol),
        )
        .toList();

    if (mounted) setState(() {});
  }
}

class AttendanceTile extends StatefulWidget {
  const AttendanceTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final AttendanceData data;

  @override
  State<AttendanceTile> createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
  late bool selected = widget.data.isPresent;
  late String str = widget.data.hasPaidFees.toString();
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        children: [
          // SlidableAction(
          //   onPressed: (context) {},
          //
          //   backgroundColor: const Color(0xFFFE4A49),
          //   foregroundColor: Colors.white,
          //   icon: Icons.delete,
          //   label: 'Delete',
          // ),
          SlidableAction(
            onPressed: (context) async {
              setState(() {
                Supabase.instance.client
                    .from('Attendance')
                    .update({feeCol: 'paid'}).eq('id', widget.data.uid);
                str = 'Paid';
              });
            },

            backgroundColor: Colors.white54, //const Color(0xFF21B7CA),
            foregroundColor: Colors.black,
            icon: Icons.money,
            label: str,
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(
            unselectedWidgetColor: Colors.white,
            toggleableActiveColor: Colors.teal),
        child: CheckboxListTile(
          checkColor: Colors.white,
          onChanged: (x) async {
            setState(() => selected = x ?? false);
            // push changes to supabase
            await Supabase.instance.client
                .from('Attendance')
                .update({widget.data.date: selected}).eq('id', widget.data.uid);

            // print('${widget.data.uid} $x');
          },
          value: selected,
          // secondary: Text(widget.data.hasPaidFees, style: TextStyle(color: Colors.black),),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          title: Text(
            widget.data.name.toString(),
            style: const TextStyle(fontSize: 23, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AttendanceData {
  final int uid;
  final String name;
  final bool isPresent;
  final String date;
  final String hasPaidFees;

  AttendanceData(
      this.uid, this.name, this.isPresent, this.date, this.hasPaidFees);

  factory AttendanceData.fromMap(
      Map<String, dynamic> map, String dayCol, String feeCol) {
    return AttendanceData(
      map['id'],
      map['Name'],
      map[dayCol],
      dayCol,
      map[feeCol],
      //feeCol
    );
  }
}

extension on DateTime {
  String get toDateCol => '${day}_${month}_${year.toString().substring(2, 4)}';
}
