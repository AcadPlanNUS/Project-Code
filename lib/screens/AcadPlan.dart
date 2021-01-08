import 'package:flutter/material.dart';
import 'package:hackAndRoll/widgets/Semester.dart';

class AcadPlan extends StatefulWidget {
  List<String> csModules;
  int sem;
  List<String> semList = [
    "Year 1 Semester 1",
    "Year 1 Semester 2",
    "Year 2 Semester 1",
    "Year 2 Semester 2",
    "Year 3 Semester 1",
    "Year 3 Semester 2",
    "Year 4 Semester 1",
    "Year 4 Semester 2"
  ];
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
    print(widget.sem);
    List<String> list = [...widget.semList];
    if (widget.sem > 0) {
      list.removeRange(0, widget.sem);
    }
    List<Widget> sems = new List();
    for (int i = 0; i < list.length; i++) {
      if (list[i] == "Year 4 Semester 1") {
        sems.add(Semester(["ATAP"], "Year 4 Semester 1"));
      } else {
        sems.add(getSingleSemester(i * 5, list[i]));
      }
    }
    return ListView(
      children: sems
      
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
