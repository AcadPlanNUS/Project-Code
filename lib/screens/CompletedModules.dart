import 'package:flutter/material.dart';

class CompletedModules extends StatefulWidget {
  var csModules = [
     "CS1101S", "CS1231S", "MA1521", "MA1101R", 
     "ULR", "CS2030", "CS2040S", "CS2100", "IS1103",
      "ULR", "CP2106", "CS2103T", "CS2105", "CS2106", 
      "ST2334", "ULR", "CS3230", "ES2660", "Focus Area",
      "ULR", "ULR", "CS3203", "CS3219", "CS4211", "CS4239",
      "CS4218", "Science", "UE", "UE", "UE", "FOCUS AREA", "UE", "UE", "UE", "UE" 
    ];

  @override
  _CompletedModulesState createState() => _CompletedModulesState();
}

class _CompletedModulesState extends State<CompletedModules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acad Planner NUS'),
      ),
      body: ListView(
        children: widget.csModules
          .map((mod) => ListTile(
            onTap: null, 
            title: Text('hello'),
          )
      ).toList(),)
    );
  }
}