import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stive/constants/creds.dart';
import 'package:stive/models/post.dart';

String tp = ep + 'post/';
Future<List<Post>?> postList() async {
  List<Post>? res;
  await http.get(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      res = convertToPostList(jsonDecode(response.body));
    }
  });

  return res;
}

List<Post> convertToPostList(dynamic dict) {
  List<Post> fin = [];
  for (dynamic i in dict) {
    fin.add(Post.fromJSON(i));
  }
  return fin;
}

Future<bool> createPost(Post newPost) async {
  bool res = false;
  await http
      .post(
    Uri.parse(tp),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(newPost.toJson()),
  )
      .then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      newPost.id = jsonDecode(response.body)["insertedId"];
      res = true;
    }
  });
  return res;
}

Future<Post?> postById(String id) async {
  Post? res;
  await http.get(
    Uri.parse(tp + id),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ).then((dynamic response) {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      res = Post.fromJSON(jsonDecode(response.body));
    }
  });

  return res;
}

Future<bool> deletePostById(String id) async {
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

Future<bool> addPollToPost(String post, String poll) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + post + '/add/poll/' + poll),
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

Future<bool> removePollFromPost(String post, String poll) async {
  bool res = false;
  await http
      .patch(
    Uri.parse(tp + post + '/remove/option/' + poll),
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
