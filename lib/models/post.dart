import 'package:flutter/material.dart';
import 'package:stive/widgets/poll.dart';

class Post {
  String id, title, description, imageUrl;
  DateTime postFrom, postTill;
  List<Poll> polls = [];
  Post(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.postFrom,
      required this.postTill,
      required this.polls});
}
