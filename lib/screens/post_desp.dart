import 'package:flutter/material.dart';

class PostDescription extends StatelessWidget {
  String title;
  String description;
  PostDescription({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text(
        'Hello',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
