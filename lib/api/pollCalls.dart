import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import 'package:stive/models/pollModel.dart';

String tp = ep + 'poll/';
Future<List<PollModel>?> optionList() async {
  List<PollModel>? res;
  await http.get(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      res = convertToPollList(jsonDecode(response.body));
    }
  });

  return res;
}

List<PollModel> convertToPollList(dynamic dict) {
  List<PollModel> fin = [];
  for (dynamic i in dict) {
    fin.add(PollModel.fromJSON(i));
  }
  return fin;
}

Future<bool> createPoll(PollModel newPoll) async {
  bool res = false;
  await http
      .post(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newPoll.toJson()),
  )
      .then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      newPoll.id = jsonDecode(response.body)["insertedId"];
      res = true;
    }
  });
  return res;
}

Future<PollModel?> pollById(String id) async {
  PollModel? res;
  await http.get(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      res = PollModel.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<bool> deletePollById(String id) async {
  bool res = false;
  await http.delete(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 &&
        response.statusCode <= 210 &&
        jsonDecode(response.body)["acknowledged"]) {
      res = true;
    }
  });

  return res;
}

Future<bool> addOptionToPoll(String poll, String option) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + poll + '/add/option/' + option),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode >= 200 &&
        response.statusCode <= 210 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}

Future<bool> optionUnSelectedByStudent(String poll, String option) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + poll + '/remove/option/' + option),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  )
      .then((dynamic response) {
    if (response.statusCode >= 200 &&
        response.statusCode <= 210 &&
        jsonDecode(response.body)["acknowledged"] == true) {
      res = true;
    }
  });
  return res;
}
