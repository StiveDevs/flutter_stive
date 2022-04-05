import 'package:flutter/material.dart';
import 'package:stive/models/post.dart';
import 'package:stive/models/student.dart';
import 'package:stive/widgets/poll.dart';

class PostDescription extends StatelessWidget {
  Post selected;
  Student curr;
  PostDescription({Key? key, required this.selected, required this.curr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selected.title,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              selected.description,
              style: TextStyle(color: Colors.white),
            ),
            selected.polls.isNotEmpty
                ? PollWidget()
                : const Text(
                    'No Poll Available',
                    style: TextStyle(color: Colors.white),
                  ),
          ],
        ),
      ),
    );
  }
}
