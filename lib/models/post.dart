import 'package:flutter/material.dart';

class PostWidget {
  int id;
  String title;
  String subtitle;
  Icon ic;
  String description;
  bool pollAvailable;
  PostWidget(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.ic,
      required this.description,
      required this.pollAvailable});
}
