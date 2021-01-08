import 'package:flutter/material.dart';

class ModuleTile extends StatefulWidget {
  Color color;
  String moduleName;
  Function _addModule;
  Function _changeColor;

  ModuleTile(this.color, this.moduleName, this._addModule, this._changeColor);

  @override
  _ModuleTileState createState() => _ModuleTileState();
}

class _ModuleTileState extends State<ModuleTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: widget.color),
      child: ListTile(title: Text('widget.moduleName'), 
        onTap: widget._addModule,
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 5,
          child: Text(widget.moduleName[0]),
        ),
      )
    );
  }
}