import 'package:stive/api/studentCalls.dart';
import 'package:stive/models/student.dart';

class Option {
  String id, name;
  List<Student> selectedBy;

  Option({required this.name, required this.selectedBy, this.id = ""});

  Option.fromJSON(Map<String, dynamic> json)
      : id = json["_id"] ?? "",
        name = json["name"] ?? "",
        selectedBy = convertToStudentList(json["selectedBy"] ?? []);

  Map<String, dynamic> toJson() => {"name": name};
}
