
import 'package:flutter/material.dart';
import 'package:hackAndRoll/widgets/Semester.dart';

class AcadPlan extends StatefulWidget {
  List<String> csModules;
  String sem;
  AcadPlan(this.csModules, this.sem);
  @override
  _AcadPlanState createState() => _AcadPlanState();
}


class _AcadPlanState extends State<AcadPlan> {

Widget getSingleSemester(int start, String name) {
  List<String> mods = new List();
  for (int i = start; i < start + 5; i++) {
    if (i < widget.csModules.length) {
      mods.add(widget.csModules[i]);
    } 
  }
  return Semester(mods, name);
}

Widget getAllSems() {
  return ListView(
    children: <Widget>[
      getSingleSemester(0, 'Year 1 Semester 1'),
      getSingleSemester(5, 'Year 1 Semester 2'),
      getSingleSemester(10, 'Year 2 Semester 1'),
      getSingleSemester(15, 'Year 2 Semester 2'),
      getSingleSemester(20, 'Year 3 Semester 1'),
      getSingleSemester(25, 'Year 3 Semester 2'),
      Semester(["ATAP"], "Year 4 Semester 1"),
      getSingleSemester(30, 'Year 4 Semester 2'),

    ],
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: const Text('Acad Plan'),
    ), 
      body: getAllSems());
    
  }
}