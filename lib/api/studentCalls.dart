import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import '../models/student.dart';

String tp = ep + 'student/';

Future<List<Student>?> studentList() async {
  List<Student> res = [];
  await http.get(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
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
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newUser.toJson()),
  )
      .then((dynamic response) {
    var resp = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      newUser.id = resp["upsertedId"];
      res = true;
    }
  });
  return res;
}

Future<Student?> studentById(String id) async {
  Student? res;
  await http.get(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      res = Student.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<bool> deleteStudentById(String id) async {
  bool res = false;
  await http
      .delete(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode >= 200 &&
        response.statusCode <= 210 &&
        jsonDecode(response.body)["acknowledged"]) {
      res = true;
    }
  });

  return res;
}
