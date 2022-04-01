import 'package:stive/widgets/poll.dart';

class Post {
  String id, title, description, imageUrl;
  DateTime postFrom, postTill;
  List<PollWidget> polls = [];
  Post(
      {required this.id,
      required this.title,
      required this.description,
      required this.postFrom,
      required this.postTill,
      required this.polls,
      this.imageUrl =
          "https://drive.google.com/uc?export=view&id=1edwpQvH_JURwGsArCc8NyPEe8EzdpzvQ"});
}
