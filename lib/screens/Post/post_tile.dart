import 'package:flutter/material.dart';
import 'package:stive/models/post.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Post/post_desc.dart';

class PostTile extends StatelessWidget {
  Student curr;
  Post selected;
  PostTile({Key? key, required this.curr, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image(image: NetworkImage(selected.imageUrl)),
        title: Text(
          selected.title,
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDescription(
                selected: selected,
                curr: curr,
              ),
            ),
          );
        },
      ),
    );
  }
}
