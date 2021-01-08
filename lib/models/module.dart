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