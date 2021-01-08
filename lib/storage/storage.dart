import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hackAndRoll/models/module.dart';

class Storage {

  List<Module> module;

  Future<bool> fetchModule() async {
    final response =
        await http.get('https://api.nusmods.com/v2/2020-2021/moduleList.json');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      module = parseModules(response.body);
      return true;
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
}