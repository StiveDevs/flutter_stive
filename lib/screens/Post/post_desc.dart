import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stive/api/postCalls.dart';
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
          }
        },
        child: curr.coordinator ? Icon(Icons.add) : SizedBox.shrink(),
      ),
      appBar: AppBar(
        title: Text(
          selected.title,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: selected.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              selected.description,
              style: const TextStyle(color: Colors.white),
            ),
            selected.polls.isNotEmpty
                ? PollWidget(poll: selected.polls[0], curr: curr)
                : const SizedBox.shrink(),
            curr.coordinator
                ? TextButton(
                    onPressed: () async {
                      bool res = false;
                      res = await deletePostById(selected.id);
                      if (res) {
                        Navigator.of(context).pop();
                        infoSnackBar("Deleted Post", context);
                      } else {
                        errorSnackBar("Couldn't delete post", context);
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: const Text(
                          "Delete Post",
                          style: TextStyle(color: Colors.white),
                        )))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
