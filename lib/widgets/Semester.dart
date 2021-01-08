import 'package:flutter/material.dart';

class Semester extends StatelessWidget {
  List<String> mods;
  String name;
  Semester(this.mods, this.name);

  List<Widget> getWidgets() {
    List<Widget> list = new List();
    list.add(new Card(child: Text(name)));
    for (int i = 0; i < mods.length; i++) {
      list.add(new Text(mods[i]));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: getWidgets()); 
  }
}