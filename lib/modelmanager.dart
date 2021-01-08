import 'package:hackAndRoll/models/module.dart';

class ModelManager {
  
  List<Module> modules;

  ModelManager({this.modules});

  Module getModule(String module) {
    for(Module mod in modules) {
      if (mod.moduleCode == module) {
        return mod;
      }
    }
    return null;
  }

}