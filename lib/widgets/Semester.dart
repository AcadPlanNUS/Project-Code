import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Semester extends StatelessWidget {
  List<String> mods;
  String name;
  Semester(this.mods, this.name);

  List<Widget> getWidgets() {
    List<Widget> list = new List();
    list.add(Container(
      padding: new EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text(name,
          style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold)),
    ));
    for (int i = 0; i < mods.length; i++) {
      list.add(
        new ElevatedButton(
            child: Text(mods[i]),
            onPressed: () async {
              String url;
              switch (mods[i]) {
                case ("ULR"):
                  url =
                      "http://www.nus.edu.sg/registrar/academic-information-policies/undergraduate-students/general-education/five-pillars";
                  break;
                case ("UE"):
                  url =
                      "http://www.nus.edu.sg/nusbulletin/school-of-computing/undergraduate-education/degree-requirements/programme-structure/";
                  break;
                default:
                  url =
                      "https://nusmods.com/modules/" + mods[i].substring(0, 7);
              }
              if (await canLaunch(url) != null) {
                await launch(url);
              } else {
                // can't launch url, there is some error
                throw "Could not launch $url";
              }
            }),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getWidgets()));
  }
}
