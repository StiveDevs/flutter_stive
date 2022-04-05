import 'package:flutter/material.dart';
import 'package:stive/api/clubCalls.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/Club/clubs_desc.dart';
import 'package:stive/widgets/misc_widgets.dart';

class Clubs extends StatefulWidget {
  Student curr;
  Clubs({Key? key, required this.curr}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    Future<List<Club>?> clubsList = clubList();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FutureBuilder(
            future: clubsList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Club>?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text("No data!");
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image(
                              image:
                                  NetworkImage(snapshot.data![index].logoUrl)),
                          title: Text(
                            snapshot.data![index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClubsDescription(
                                  selected: snapshot.data![index],
                                  curr: widget.curr,
                                ),
                              ),
                            );
                          },
                        ),
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
}
