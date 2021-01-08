import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hackAndRoll/storage/storage.dart';
import 'package:hackAndRoll/models/module.dart';
import 'package:hackAndRoll/modelmanager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ModelManager modelManager;
  Future<List<Module>> futureModule;

  @override
  void initState() {
    super.initState();
    futureModule = fetchModule(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Module>>(
            future: futureModule,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ModelManager modelManager = new ModelManager(modules: snapshot.data);
                return Text(modelManager.getModule("CS2101").title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}