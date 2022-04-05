import 'package:stive/models/student.dart';

class Option {
  String id, name;
  List<Student> selectedBy;

  Option({required this.name, required this.selectedBy, this.id = ""});
}
