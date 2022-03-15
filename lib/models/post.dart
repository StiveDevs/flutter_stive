import 'package:flutter/material.dart';
import 'package:stive/dummy/post_data.dart';

class PostWidget {
  int id;
  String title;
  String subtitle;
  Icon ic;
  String description;
  PostWidget(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.ic,
      required this.description});
}
