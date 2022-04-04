import 'package:flutter/material.dart';
import 'package:stive/models/post.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/create_add_post.dart';
import 'package:stive/screens/post_desp.dart';

class ClubsDescription extends StatefulWidget {
  String name, description;
  List<Student> coordinators;
  List<Post> posts;
  ClubsDescription(
      {required this.name,
      required this.description,
      required this.coordinators,
      required this.posts});

  @override
  State<ClubsDescription> createState() => _ClubsDescriptionState();
}

class _ClubsDescriptionState extends State<ClubsDescription> {
  bool switch_content = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          actions: <Widget>[
            switch_content
                ? IconButton(
                    icon: const Icon(Icons.playlist_add_circle_sharp),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAddPost()),
                      );
                    })
                : Container(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              switch_content = !switch_content;
            });
          },
          child: const Icon(Icons.swap_horizontal_circle),
        ),
        body: Center(
          child: switch_content
              ? ListView.builder(
                  itemCount: widget.posts.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.ac_unit),
                        title: Text(
                          widget.posts[index].title,
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDescription(
                                title: widget.posts[index].title,
                                description: widget.posts[index].description,
                                pollAvailable: false,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  })
              : Column(children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.white),
                  )
                ]),
        ));
  }
}
