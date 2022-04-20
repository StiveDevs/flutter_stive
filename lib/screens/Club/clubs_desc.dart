import 'package:flutter/material.dart';
import 'package:stive/api/clubCalls.dart';
import 'package:stive/constants/misc.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Post/create_add_post.dart';
import 'package:stive/screens/Post/post_tile.dart';
import 'package:stive/widgets/misc_widgets.dart';

// ignore: must_be_immutable
class ClubsDescription extends StatefulWidget {
  Club selected;
  Student curr;
  ClubsDescription({Key? key, required this.selected, required this.curr})
      : super(key: key);

  @override
  State<ClubsDescription> createState() => _ClubsDescriptionState();
}

class _ClubsDescriptionState extends State<ClubsDescription> {
  bool switchContent = false;
  @override
  Widget build(BuildContext context) {
    widget.curr.coordinator =
        studentInList(widget.curr.email, widget.selected.coordinators) == null
            ? false
            : true;
    widget.curr.member =
        studentInList(widget.curr.email, widget.selected.members) == null
            ? false
            : true;
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
                switchContent = !switchContent;
              });
            },
            child: const Icon(Icons.swap_horizontal_circle),
          ),
          if (!switchContent)
            TextButton(
                onPressed: () async {
                  bool res = false;
                  if (widget.curr.member) {
                    res = await removeMemberFromClub(
                        widget.selected.id.toString(),
                        widget.curr.id.toString());
                  } else {
                    res = await addMemberToClub(widget.selected.id.toString(),
                        widget.curr.id.toString());
                  }
                  if (res) {
                    if (widget.curr.member) {
                      widget.selected.members.remove(widget.curr);
                    } else {
                      widget.selected.members.add(widget.curr);
                    }
                    widget.curr.member = !widget.curr.member;
                  }
                  setState(() {
                    if (res) {
                      infoSnackBar("Success", context);
                    } else {
                      errorSnackBar("Failed", context);
                    }
                  });
                },
                child: Text(widget.curr.member ? "Leave Club" : "Join Club")),
          const SizedBox(
            width: 10,
          ),
          switchContent
              ? FloatingActionButton(
                  heroTag: "h2",
                  onPressed: () {
                    if (widget.curr.coordinator) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateAddPost(clubId: widget.selected.id)),
                      );
                    }
                  },
                  child: widget.curr.coordinator
                      ? const Icon(Icons.playlist_add_circle_sharp)
                      : SizedBox.shrink(),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: switchContent
          ? ListView.builder(
              itemCount: widget.selected.posts.length,
              itemBuilder: (BuildContext ctx, int index) {
                return PostTile(
                    curr: widget.curr, selected: widget.selected.posts[index]);
              })
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Description",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    child: Text(
                      widget.selected.description,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Coordinators",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    child: widget.selected.coordinators.isEmpty
                        ? const Text(
                            "No Coordinators",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.selected.coordinators.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image(
                                      width: 100,
                                      image: NetworkImage(widget.selected
                                          .coordinators[index].profilePicUrl)),
                                  title: Text(
                                      widget.selected.coordinators[index].name,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: widget.curr.email == techSecMail
                                      ? IconButton(
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                          ),
                                          onPressed: () async {
                                            bool res =
                                                await removeCoordinatorFromClub(
                                                    widget.selected.id,
                                                    widget
                                                        .selected
                                                        .coordinators[index]
                                                        .id);
                                            if (res) {
                                              widget.selected.members.remove(
                                                  widget.selected
                                                      .coordinators[index]);
                                              setState(() {
                                                infoSnackBar(
                                                    "Removed Coordinator",
                                                    context);
                                              });
                                            } else {
                                              errorSnackBar(
                                                  "Error removing Coordinator",
                                                  context);
                                            }
                                          },
                                        )
                                      : const SizedBox(),
                                ),
                              );
                            }),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Members",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    child: widget.selected.members.isEmpty
                        ? const Text(
                            "No Members",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.selected.members.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image(
                                      width: 100,
                                      image: NetworkImage(widget.selected
                                          .members[index].profilePicUrl)),
                                  title: Text(
                                      widget.selected.members[index].name,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      widget.curr.coordinator
                                          ? IconButton(
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.red,
                                              ),
                                              onPressed: () async {
                                                bool res =
                                                    await removeMemberFromClub(
                                                        widget.selected.id,
                                                        widget.selected
                                                            .members[index].id);
                                                if (res) {
                                                  widget.selected.members
                                                      .remove(widget.selected
                                                          .members[index]);
                                                  setState(() {
                                                    infoSnackBar(
                                                        "Removed Member",
                                                        context);
                                                  });
                                                } else {
                                                  errorSnackBar(
                                                      "Error removing member",
                                                      context);
                                                }
                                              },
                                            )
                                          : const SizedBox(),
                                      widget.curr.email == techSecMail
                                          ? IconButton(
                                              icon: Icon(
                                                studentInList(
                                                            widget
                                                                .selected
                                                                .members[index]
                                                                .email,
                                                            widget.selected
                                                                .coordinators) ==
                                                        null
                                                    ? Icons.person_add
                                                    : Icons.person_remove,
                                                color: Colors.red,
                                              ),
                                              onPressed: () async {
                                                bool res =
                                                    await addCoordinatorToClub(
                                                        widget.selected.id,
                                                        widget.selected
                                                            .members[index].id);
                                                if (res) {
                                                  widget.selected.coordinators
                                                      .add(widget.selected
                                                          .members[index]);
                                                  setState(() {
                                                    infoSnackBar(
                                                        "Made Coordinator",
                                                        context);
                                                  });
                                                } else {
                                                  errorSnackBar(
                                                      "Error adding Coordinator",
                                                      context);
                                                }
                                              },
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ),
                  if (widget.curr.email == techSecMail)
                    TextButton(
                        onPressed: () async {
                          bool res = false;
                          res = await deleteClubById(widget.selected.id);
                          if (res) {
                            Navigator.of(context).pop();
                            infoSnackBar("Deleted Club", context);
                          } else {
                            errorSnackBar("Couldn't delete club", context);
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
                              "Delete Club",
                              style: TextStyle(color: Colors.white),
                            ))),
                ],
              ),
            ),
    );
  }
}
