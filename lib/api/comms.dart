import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';

String ep = "https://stive-api.herokuapp.com/";

Future<User?> userById(int id) async {
  User? res;
  await http.put(
    Uri.parse(ep + 'student/' + id.toString() + '/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = User.fromJSON(jsonDecode(response.body));
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
