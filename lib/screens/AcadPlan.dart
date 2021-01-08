
import 'package:flutter/material.dart';
import 'package:hackAndRoll/widgets/Semester.dart';

class AcadPlan extends StatefulWidget {
  var csModules = [
    "CS1101S Programming Methodology",
    "CS1231S Discrete Structures",
    "MA1521 Calculus for Computing",
    "MA1101R Linear Algebra I",
    "ULR",
    "CS2030S Programming Methodology II",
    "CS2040S Data Structures and Algorithms",
    "CS2100 Computer Organisation",
    "IS1103 Ethics in Computing",
    "ULR",
    "CS2103T Software Engineering",
    "CS2105 Introduction to Computer Networks",
    "CS2106 Introduction to Operating Systems",
    "ST2334 Probability and Statistics",
    "ULR",
    "CS3230 Design and Analysis of Algorithms",
    "ES2660 Communicating in the Information Age",
    "Focus Area",
    "ULR",
    "ULR",
    "CS3203 Software Engineering Project",
    "CS3219 Software Engineering Principles and Patterns",
    "CS4211 Formal Methods for Software Engineering",
    "CS4239 Software Security",
    "CS4218 Software Testing",
    "Science",
    "UE",
    "UE",
    "UE",
    "Focus Area",
    "Focus Area",
    "UE",
    "UE",
    "UE",
    "UE"
  ];
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