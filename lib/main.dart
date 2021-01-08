import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Module>> fetchModule(http.Client client) async {
  final response =
      await http.get('https://api.nusmods.com/v2/2020-2021/moduleList.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return compute(parseModules, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Module');
  }
}

List<Module> parseModules(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Module>((json) => Module.fromJson(json)).toList();
}

class Module {
  final String moduleCode;
  final String title;

  Module({this.moduleCode, this.title});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      moduleCode: json['moduleCode'],
      title: json['title'],
    );
  }

  @override
  String toString() {
    return moduleCode + " " + title;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Module>>(
        future: fetchModule(http.Client()),
        builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.removeAt(1).toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
    );
  }
}