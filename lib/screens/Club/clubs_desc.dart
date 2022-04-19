import 'package:flutter/material.dart';
import 'package:stive/api/clubCalls.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Post/create_add_post.dart';
import 'package:stive/screens/Post/post_desc.dart';
import 'package:stive/screens/Post/post_tile.dart';
import 'package:stive/widgets/misc_widgets.dart';

class ClubsDescription extends StatefulWidget {
  Club selected;
  Student curr;
  ClubsDescription({Key? key, required this.selected, required this.curr})
      : super(key: key);

  @override
  State<ClubsDescription> createState() => _ClubsDescriptionState();
}

class _ClubsDescriptionState extends State<ClubsDescription> {
  bool switch_content = false;
  bool member = false;
  @override
  Widget build(BuildContext context) {
    for (Student s in widget.selected.members) {
      if (s.id == widget.curr.id) {
        member = true;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selected.name),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "h1",
            onPressed: () {
              setState(() {
                switch_content = !switch_content;
              });
            },
            child: const Icon(Icons.swap_horizontal_circle),
          ),
          if (!switch_content)
            TextButton(
                onPressed: () async {
                  bool res = false;
                  if (member) {
                    res = await removeMemberFromClub(
                        widget.selected.id.toString(),
                        widget.curr.id.toString());
                  } else {
                    res = await addMemberToClub(widget.selected.id.toString(),
                        widget.curr.id.toString());
                  }
                  setState(() {
                    if (res) {
                      member = !member;
                      infoSnackBar("Success", context);
                    } else
                      errorSnackBar("Failed", context);
                  });
                },
                child: Text(member ? "Leave Club" : "Join Club")),
          const SizedBox(
            width: 10,
          ),
          switch_content
              ? FloatingActionButton(
                  heroTag: "h2",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CreateAddPost(clubId: widget.selected.id)),
                    );
                  },
                  child: const Icon(Icons.playlist_add_circle_sharp),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: switch_content
          ? ListView.builder(
              itemCount: widget.selected.posts.length,
              itemBuilder: (BuildContext ctx, int index) {
                return PostTile(
                    curr: widget.curr, selected: widget.selected.posts[index]);
              })
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text(
                    widget.selected.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  const Text(
                    "Coordinators",
                    style: TextStyle(color: Colors.white),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.selected.coordinators.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return ListTile(
                              leading: Image(
                                  image: NetworkImage(widget.selected
                                      .coordinators[index].profilePicUrl)),
                              title: Text(
                                  widget.selected.coordinators[index].name,
                                  style: TextStyle(color: Colors.white)),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
