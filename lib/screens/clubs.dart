import 'package:flutter/material.dart';
import 'package:stive/dummy/club_data.dart';
import 'package:stive/screens/clubs_desp.dart';
import 'package:stive/widgets/create_club.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: DUMMY_CLUB.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.ac_unit),
              title: Text(
                DUMMY_CLUB[index].name,
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubsDescription(
                      name: DUMMY_CLUB[index].name,
                      description: DUMMY_CLUB[index].description,
                      coordinators: DUMMY_CLUB[index].coordinators,
                      posts: DUMMY_CLUB[index].posts,
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
