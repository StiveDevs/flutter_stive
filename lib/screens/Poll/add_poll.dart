import 'package:flutter/material.dart';
import 'package:stive/models/post.dart';

class PollAdd extends StatefulWidget {
  Post selected;
  PollAdd({Key? key, required this.selected}) : super(key: key);

  @override
  State<PollAdd> createState() => _PollAddState();
}

class _PollAddState extends State<PollAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
