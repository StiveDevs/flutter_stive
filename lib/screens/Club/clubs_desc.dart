import 'package:flutter/material.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Post/create_add_post.dart';
import 'package:stive/screens/Post/post_desc.dart';
import 'package:stive/screens/Post/post_tile.dart';

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
  @override
  Widget build(BuildContext context) {
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
                            builder: (context) => CreateAddPost()),
                      );
                    },
                    child: const Icon(Icons.playlist_add_circle_sharp),
                  )
                : SizedBox.shrink()
          ],
        ),
        body: Center(
          child: switch_content
              ? ListView.builder(
                  itemCount: widget.selected.posts.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return PostTile(
                        curr: widget.curr,
                        selected: widget.selected.posts[index]);
                  })
              : Column(children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text(
                    widget.selected.description,
                    style: const TextStyle(color: Colors.white),
                  )
                ]),
        ));
  }
}
