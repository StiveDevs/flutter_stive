import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

String ep = "http://10.0.2.2:8000/";

Future<User?> userById(int id) async {
  User? res;
  await http.put(
    Uri.parse(ep + 'student/' + id.toString() + '/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = User.fromJSON(response.body());
    }
  });

  return res;
}

Future<List<User>?> userList() async {
  List<User> res = [];
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

List<User> convertToUserList(dynamic dict) {
  List<User> fin = [];
  for (dynamic i in dict) {
    fin.add(User.fromJSON(i));
  }
  return fin;
}

Future<String> createUser(User newUser) async {
  String resp = "failed";
  await http
      .post(
    Uri.parse(ep + 'student/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: newUser.toJson(),
  )
      .then((dynamic response) {
    if (response.statusCode == 201) {
      newUser.id = jsonDecode(response.body)["insertedId"];
      resp = "ok";
    }
  });
  return resp;
}
