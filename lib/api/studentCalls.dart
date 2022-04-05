import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import '../models/student.dart';

Future<bool> deleteStudentById(int id) async {
  bool res = false;
  await http.put(
    Uri.parse(ep + 'student/' + id.toString() + '/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 204 &&
        jsonDecode(response.body)["acknowledged"]) {
      res = true;
    }
  });

  return res;
}

Future<Student?> studentById(int id) async {
  Student? res;
  await http.put(
    Uri.parse(ep + 'student/' + id.toString() + '/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = Student.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<List<Student>?> studentList() async {
  List<Student> res = [];
  await http.put(
    Uri.parse(ep + 'student/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = convertToStudentList(jsonDecode(response.body));
    }
  });

  return res;
}

List<Student> convertToStudentList(dynamic dict) {
  List<Student> fin = [];
  for (dynamic i in dict) {
    fin.add(Student.fromJSON(i));
  }
  return fin;
}

Future<bool> createStudent(Student newUser) async {
  bool res = false;
  await http
      .post(
    Uri.parse(ep + 'student/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newUser.toJson()),
  )
      .then((dynamic response) {
    var resp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      newUser.id = resp["insertedId"];
      res = true;
    }
  });
  return res;
}
