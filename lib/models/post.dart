import 'package:stive/models/pollModel.dart';
import 'package:stive/api/pollCalls.dart';

class Post {
  String id, title, description, imageUrl;
  DateTime postFrom, postTill;
  List<PollModel> polls;
  Post(
      {required this.title,
      required this.description,
      required this.postFrom,
      required this.postTill,
      required this.polls,
      this.imageUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ",
      this.id = ""});

  Post.fromJSON(Map<String, dynamic> json)
      : id = json["_id"],
        title = json["title"] ?? "",
        description = json["description"] ?? "",
        imageUrl = json["imageUrl"] ?? "",
        postFrom = json["postFrom"] != null
            ? json["postFrom"] as DateTime
            : DateTime.now(),
        postTill = json["postTill"] != null
            ? json["postTill"] as DateTime
            : DateTime.now(),
        polls = convertToPollList(json["polls"] ?? []);

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "imageUrl": imageUrl,
        "postFrom": postFrom,
        "PostTill": postTill,
        "polls": []
      };
}
