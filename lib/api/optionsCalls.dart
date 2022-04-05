import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import 'package:stive/models/option.dart';

String tp = ep + 'option/';
Future<List<Option>?> optionList() async {
  List<Option>? res;
  await http.get(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = convertToOptionList(jsonDecode(response.body));
    }
  });

  return res;
}

List<Option> convertToOptionList(dynamic dict) {
  List<Option> fin = [];
  for (dynamic i in dict) {
    fin.add(Option.fromJSON(i));
  }
  return fin;
}

Future<bool> createOption(Option newOption) async {
  bool res = false;
  await http
      .post(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newOption.toJson()),
  )
      .then((dynamic response) {
    if (response.statusCode == 200) {
      newOption.id = jsonDecode(response.body)["insertedId"];
      res = true;
    }
  });
  return res;
}

Future<Option?> optionById(String id) async {
  Option? res;
  await http.get(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode == 200) {
      res = Option.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<bool> deleteOptionById(String id) async {
  bool res = false;
  await http.delete(
    Uri.parse(tp + id),
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

Future<bool> optionSelectedByStudent(String option, String student) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + option + '/add/selectedBy/' + student),
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

Future<bool> optionUnSelectedByStudent(String option, String student) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + option + '/remove/selectedBy/' + student),
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
