import 'package:flutter/material.dart';
import 'package:stive/models/user.dart';
import 'package:stive/screens/user_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.currUser}) : super(key: key);
  final User currUser;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String screen = "User Feed";

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
        body: screenSwitch(screen, widget.currUser),
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              drawerTile("User Feed", Icons.list),
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
    case "User Feed":
      return "User Feed";
    default:
      return "Huh! This is weird.";
  }
}

Widget screenSwitch(String screen, User currUser) {
  switch (screen) {
    case "User Feed":
      return const UserFeed();
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
