import 'package:stive/models/student.dart';
import 'post.dart';

class Club {
  String id, name, description, logoUrl;
  List<Student> coordinators, members;
  List<Post> posts;
  Club(
      {required this.id,
      required this.name,
      required this.description,
      required this.coordinators,
      required this.members,
      required this.posts,
      this.logoUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ"});
}
