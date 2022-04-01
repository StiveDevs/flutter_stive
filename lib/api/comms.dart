import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/student.dart';

String ep = "https://stive-api.herokuapp.com/";

Future<Student?> userById(int id) async {
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

Future<List<Student>?> userList() async {
  List<Student> res = [];
  await http.put(
    Uri.parse(ep + 'student/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = convertToUserList(jsonDecode(response.body));
    }
  });

  return res;
}

List<Student> convertToUserList(dynamic dict) {
  List<Student> fin = [];
  for (dynamic i in dict) {
    fin.add(Student.fromJSON(i));
  }
  return fin;
}

Future<String> createUser(Student newUser) async {
  String ret = "failed";
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
      ret = "ok";
    }
  });
  return ret;
}
