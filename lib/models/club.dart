import 'package:stive/api/postCalls.dart';
import 'package:stive/api/studentCalls.dart';
import 'package:stive/models/student.dart';
import 'post.dart';

class Club {
  String id, name, description, logoUrl;
  List<Student> coordinators, members;
  List<Post> posts;
  Club(
      {required this.name,
      required this.description,
      required this.coordinators,
      required this.members,
      required this.posts,
      this.logoUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ",
      this.id = ""});

  Club.fromJSON(Map<String, dynamic> json)
      : id = json["_id"] ?? "",
        name = json["name"] ?? "",
        description = json["description"] ?? "",
        logoUrl = json["logoUrl"] ??
            "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ",
        coordinators = convertToStudentList(json["coordinators"] ?? []),
        members = convertToStudentList(json["members"] ?? []),
        posts = convertToPostList(json["posts"] ?? []);

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "logoUrl": logoUrl,
      };
}
