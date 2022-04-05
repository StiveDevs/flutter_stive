import 'package:flutter/material.dart';
import 'package:stive/models/student.dart';
import 'package:stive/screens/settings.dart';
import 'package:stive/screens/user_feed.dart';
import 'package:stive/widgets/create_club.dart';

import 'Club/clubs.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.currUser}) : super(key: key);
  Student currUser;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String screen = "Feed";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, "/");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(titleSwitch(screen)),
        ),
        floatingActionButton: titleSwitch(screen) == "Clubs"
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateClub()),
                  );
                },
                child: const Icon(Icons.add))
            : const SizedBox.shrink(),
        body: screenSwitch(screen, widget.currUser),
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              drawerTile("Feed", Icons.list),
              drawerTile("Clubs", Icons.home),
              drawerTile("Settings", Icons.settings),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerTile(String screenName, var icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
      title: Text(
        screenName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        screen = screenName;
        setState(() {});
        Navigator.pop(context);
      },
    );
  }
}

String titleSwitch(String screen) {
  switch (screen) {
    case "Feed":
      return "Feed";
    case "Clubs":
      return "Clubs";
    case "Settings":
      return "Settings";
    default:
      return "Huh! This is weird.";
  }
}

Widget screenSwitch(String screen, Student currUser) {
  switch (screen) {
    case "Feed":
      return UserFeed(
        curr: currUser,
      );
    case "Clubs":
      return Clubs(
        curr: currUser,
      );
    case "Settings":
      return Settings();
    default:
      return const Text("Lmao");
  }
}

Widget div() {
  return const Divider(
    thickness: 0.0,
    indent: 5,
    endIndent: 5,
    color: Colors.grey,
  );
}
