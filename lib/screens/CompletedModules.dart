import 'package:flutter/material.dart';

import 'package:hackAndRoll/modelmanager.dart';
import 'package:hackAndRoll/storage/storage.dart';
import '../models/module.dart';

class CompletedModules extends StatefulWidget {
  var csModules = [
     "CS1101S", "CS1231S", "MA1521", "MA1101R", 
     "ULR", "CS2030", "CS2040S", "CS2100", "IS1103",
      "ULR", "CP2106", "CS2103T", "CS2105", "CS2106", 
      "ST2334", "ULR", "CS3230", "ES2660", "Focus Area",
      "ULR", "ULR", "CS3203", "CS3219", "CS4211", "CS4239",
      "CS4218", "Science", "UE", "UE", "UE", "FOCUS AREA", "UE", "UE", "UE", "UE" 
    ];
  Color tileColor = Colors.white;

  @override
  _CompletedModulesState createState() => _CompletedModulesState();
}

class _CompletedModulesState extends State<CompletedModules> {

  ModelManager modelmanager;
  Storage storage = new Storage();
  Map<String, Module> moduleMap;

  @override
  void initState() {
    super.initState();
    storage.fetchModule().then((List<Module> modList) => addModules(modList));
  }

  void addModules(List<Module> modules) {
    moduleMap = Map.fromIterable(modules,
        key: (mod) => mod.moduleCode, value: (mod) => mod);
    // Example usage
    print(moduleMap["CS1010"].toString());
  }





  void _selectMod() {
    setState(() {
      if (widget.tileColor == Colors.white) {
        print("hello");
        widget.tileColor = Colors.green;
      } else  {
        widget.tileColor = Colors.white;
      }
          
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acad Planner NUS'),
      ),
      body: ListView(
        children: widget.csModules
          .map((mod) => Container(
            decoration: BoxDecoration(color: widget.tileColor),
            child: ListTile(
              onTap: _selectMod, 
              title: Text(mod),
          ),)
      ).toList(),)
    );
  }
}