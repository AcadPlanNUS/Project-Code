import 'package:flutter/material.dart';

class ModuleTile extends StatefulWidget {
  String moduleName;
  var completedModule;
  Color tileColor = Colors.white;

  ModuleTile(this.moduleName, this.completedModule);

  @override
  _ModuleTileState createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  void _addAndDeleteModules(String moduleName) {
    print("Hello");
    setState(() {
      if (widget.tileColor == Colors.white) {
        widget.completedModule.add(widget.moduleName);
        widget.tileColor = Colors.green;
      } else {
        widget.completedModule.removeWhere((mod) => mod == moduleName);
        widget.tileColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.tileColor),
      child: ListTile(title: Text(widget.moduleName), 
        onTap: () => _addAndDeleteModules(widget.moduleName),
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 15,
          child: Text(widget.moduleName[0]),
        ),
      )
    );
  }
}