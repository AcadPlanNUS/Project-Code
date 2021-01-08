import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

import './screens/CompletedModule.dart';

import './widgets/FirstScreenForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/completedModule' : (ctx) => CompletedModule()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  String _studentYear = '';
  String _focusArea = '';
  int _UeRemaining;
  int _GeRemaining;
  var completedMods = [];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var YearOptions = [
    {
      "display": "Year 1 Sem 1",
      "value": "Year 1 sem 1",
    },
    {
      "display": "Year 1 Sem 2",
      "value": "Year 1 sem 2",
    },
    {
      "display": "Year 2 Sem 1",
      "value": "Year 2 sem 1",
    },
    {
      "display": "Year 2 Sem 2",
      "value": "Year 2 sem 2",
    },
    {
      "display": "Year 3 Sem 1",
      "value": "Year 3 sem 1",
    },
    {
      "display": "Year 3 Sem 2",
      "value": "Year 3 sem 2",
    },
    {
      "display": "Year 4 Sem 1",
      "value": "Year 4 sem 1",
    },
    {
      "display": "Year 4 Sem 2",
      "value": "Year 4 sem 2",
    },
  ];

var FocusAreaOptions = [
    {
      "display": "Networking",
      "value": "Networking",
    },
    {
      "display": "Theory And Algorithm",
      "value": "Theory And Algorithm",
    },
    {
      "display": "Artificial Intelligence",
      "value": "Artificial Intelligence",
    },
    {
      "display": "Database System",
      "value": "Database System",
    },
    {
      "display": "Multimedia Information",
      "value": "Multimedia Information",
    },
    {
      "display": "Computer Security",
      "value": "Computer Security",
    },
    {
      "display": "Computer Graphic And Games",
      "value": "Computer Graphic And Games",
    },
    {
      "display": "Programming Languages",
      "value": "Programming Languages",
    },
    {
      "display": "Software Engineering",
      "value": "Software Engineering",
    },
  ];

  void _submitUE(String value) {
    var parse = int.parse(value);
    if (parse >= 0 && parse <= 32) {
      setState(() {
        widget._UeRemaining = parse;
      });
    }
    return;
  }

  void _submitGE(String value) {
    var parse = int.parse(value);
    if (parse >= 0 && parse <= 20) {
      setState(() {
        widget._GeRemaining = parse;
      });
    }
    return;
  }

  void _saveForm() {
    print(widget._UeRemaining);
    print(widget._GeRemaining);
    print(widget._studentYear);
    print(widget._focusArea);
    if (widget._UeRemaining != null && widget._studentYear != '' && widget._focusArea != '' && widget._GeRemaining != null) {
      Navigator.of(context).pushNamed('/completedModule');
    }
  }

  void _saveStudentYear(String value) {
    setState(() {
      widget._studentYear = value;
    });
  }

  void _saveFocusArea(String value) {
    setState(() {
      widget._focusArea = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acad Planner NUS'),
      ),
      body: SingleChildScrollView(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              elevation: 5, 
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Amount of UEs Remaining'),
                  onSubmitted: _submitUE, onChanged: _submitUE,),
                  TextField(decoration: InputDecoration(labelText: 'Amount of GEs Remaining'),
                  onSubmitted: _submitGE, onChanged: _submitGE,),
                  FirstScreenForm('Student Year', widget._studentYear, YearOptions, _saveStudentYear),
                  FirstScreenForm('Focus Area', widget._focusArea, FocusAreaOptions, _saveFocusArea),
                ],)
              ),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: Text('NEXT'),
                  onPressed: _saveForm,
                ),
              ),
          ],
        ),
      ),   
    );
  }
}