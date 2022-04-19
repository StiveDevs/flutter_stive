import 'package:flutter/material.dart';
import 'package:stive/models/post.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Poll/add_poll.dart';
import 'package:stive/widgets/misc_widgets.dart';
import 'package:stive/widgets/poll.dart';

// ignore: must_be_immutable
class PostDescription extends StatelessWidget {
  Post selected;
  Student curr;
  PostDescription({Key? key, required this.selected, required this.curr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (curr.coordinator) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PollAdd(selected: selected)),
            );
          } else {
            errorSnackBar("Only for coordinators!", context);
          }
        },
        child: const Icon(Icons.add),
      ),
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
              style: const TextStyle(color: Colors.white),
            ),
            selected.polls.isNotEmpty
                ? PollWidget(poll: selected.polls[0], curr: curr)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
