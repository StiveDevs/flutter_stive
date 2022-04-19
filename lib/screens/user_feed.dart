import 'package:flutter/material.dart';
import 'package:stive/api/clubCalls.dart';
import 'package:stive/constants/misc.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/post.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Post/post_desc.dart';
import 'package:stive/screens/Post/post_tile.dart';
import 'package:stive/widgets/misc_widgets.dart';

class UserFeed extends StatefulWidget {
  Student curr;
  UserFeed({Key? key, required this.curr}) : super(key: key);

  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  @override
  Widget build(BuildContext context) {
    Future<List<Post>?> postList = filterFeed();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: FutureBuilder(
            future: postList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text(
                    "No data!",
                    style: TextStyle(color: Colors.white),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return PostTile(
                        selected: snapshot.data![index],
                        curr: widget.curr,
                      );
                    });
              } else if (snapshot.hasError) {
                return const ErrorDisplay();
              } else {
                return const Center(child: LoadingWidget());
              }
            },
          ),
        ),
      ],
    );
  }

  Future<List<Post>?> filterFeed() async {
    List<Club>? raw = await clubList();
    if (raw == null) {
      return null;
    }
    List<Post> res = [];
    for (Club i in raw) {
      if (studentInList(widget.curr.email, i.members) != null) {
        res.addAll(i.posts);
        continue;
      }
    }
    return res;
  }
}
