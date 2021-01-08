import 'package:flutter/material.dart';
import '../widgets/moduleTile.dart';
import 'AcadPlan.dart';

class CompletedModule extends StatefulWidget {
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
    "CP2106 Independent Software Development Project (Orbital)",
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
    "UE",
    "UE",
    "UE",
    "UE"
  ];

  var completedModules = [];

  CompletedModule(this.completedModules);

  @override
  _CompletedModuleState createState() => _CompletedModuleState();
}

class _CompletedModuleState extends State<CompletedModule> {
  void _press() {
    List<String> copy = [...widget.csModules];
    copy.removeWhere((element) => widget.completedModules.contains(element));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AcadPlan(copy)),
  );
  }
  @override
  Widget build(BuildContext context) {
    List<String> sortedcsModules = [...widget.csModules];
    sortedcsModules.sort((a, b) => a.contains('C', 0) && b.contains('C', 0)
        ? 0
        : b.length.compareTo(a.length));
    return Scaffold(
      appBar: AppBar(
        title: Text('Acad Planner NUS'),
      ),
      body: ListView( 
        children: sortedcsModules
          .map((mod) => Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ModuleTile(mod, widget.completedModules),
          )
      ).toList(),),
      floatingActionButton: FloatingActionButton(
        onPressed: _press,
      ),
    );
  }
}
