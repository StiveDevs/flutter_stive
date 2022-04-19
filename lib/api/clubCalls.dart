import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import 'package:stive/models/club.dart';

String tp = ep + 'club/';
Future<List<Club>?> clubList() async {
  List<Club>? res;
  await http.get(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = convertToClubList(jsonDecode(response.body));
    }
  });

  return res;
}

List<Club> convertToClubList(dynamic dict) {
  List<Club> fin = [];
  for (dynamic i in dict) {
    fin.add(Club.fromJSON(i));
  }
  return fin;
}

Future<bool> createClub(Club newClub) async {
  bool res = false;
  await http
      .post(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newClub.toJson()),
  )
      .then((dynamic response) {
    if (response.statusCode == 200) {
      newClub.id = jsonDecode(response.body)["insertedId"];
      res = true;
    }
  });
  return res;
}

Future<Club?> clubById(String id) async {
  Club? res;
  await http.get(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = Club.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<bool> deleteClubById(String id) async {
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
    if (response.statusCode == 204 &&
        jsonDecode(response.body)["acknowledged"]) {
      res = true;
    }
  });

  return res;
}

Future<bool> addMemberToClub(String club, String member) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/add/member/' + member),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> addCoordnatorToClub(String club, String coordinator) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/add/coordinator/' + coordinator),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> addPostToClub(String club, String post) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/add/post/' + post),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> removeMemberFromClub(String club, String member) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/remove/member/' + member),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> removeCoordnatorFromClub(String club, String coordinator) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/remove/coordinator/' + coordinator),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> removePostToClub(String club, String post) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + club + '/remove/post/' + post),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}
