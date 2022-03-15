import 'package:flutter/material.dart';
import 'package:stive/dummy/post_data.dart';
import 'package:stive/screens/post_desp.dart';

class UserFeed extends StatefulWidget {
  const UserFeed({Key? key}) : super(key: key);

  @override
  _UserFeedState createState() => _UserFeedState();
}

class _UserFeedState extends State<UserFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: DUMMY_POST.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Card(
              child: ListTile(
                leading: DUMMY_POST[index].ic,
                title: Text(DUMMY_POST[index].title),
                subtitle: Text(DUMMY_POST[index].subtitle),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDescription(
                          title: DUMMY_POST[index].title,
                          description: DUMMY_POST[index].description),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
