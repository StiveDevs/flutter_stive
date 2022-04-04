import 'package:flutter/material.dart';
import 'package:stive/widgets/poll.dart';

class PostDescription extends StatelessWidget {
  String title;
  String description;
  bool pollAvailable;
  PostDescription(
      {required this.title,
      required this.description,
      required this.pollAvailable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
            pollAvailable
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
