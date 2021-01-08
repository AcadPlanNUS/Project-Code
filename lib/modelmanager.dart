import 'package:hackAndRoll/models/module.dart';

class ModelManager {
  
  List<Module> modules;

  ModelManager({this.modules});

  Module getModule(String module) {
    final mod = modules.firstWhere((element) =>
      element.moduleCode == module,
      orElse: () {
        return null;
      });
    return mod;
  }

}