import 'package:polls/polls.dart';
import 'package:flutter/material.dart';
import 'package:stive/models/option.dart';
import 'package:stive/models/pollModel.dart';
import 'package:stive/models/student.dart';

class PollWidget extends StatefulWidget {
  PollModel poll;

  PollWidget({Key? key, required this.poll}) : super(key: key);

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  List<Option>? optionList;
  Map? usersWhoVoted;
  // Map usersWhoVoted = {
  //   'test@gmail.com': 1,
  //   'deny@gmail.com': 3,
  //   'kent@gmail.com': 2,
  //   'xyz@gmail.com': 3
  // };
  
  String creator = "admin@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Container();
    /*return Polls(
      children: [
        // This cannot be less than 2, else will throw an exception
        for (Option option in optionList!)
          {
            Polls.options(
                title: option.name, value: option.selectedBy.length.toDouble()),
          }
      ],
      question: Text(
        widget.poll.name,
        style: const TextStyle(color: Colors.white),
      ),
      currentUser: user,
      creatorID: creator,
      voteData: usersWhoVoted,
      userChoice: usersWhoVoted![user],
      onVoteBackgroundColor: Colors.blue,
      leadingBackgroundColor: Colors.blue,
      backgroundColor: Colors.white,
      onVote: (choice) {
        setState(() {
          usersWhoVoted![user] = choice;
        });
        if (choice == 1) {
          setState(() {
            optionList.add(user);
          });
        }
        if (choice == 2) {
          setState(() {
            res2 += 1.0;
          });
        }
        if (choice == 3) {
          setState(() {
            res3 += 1.0;
          });
        }
        if (choice == 4) {
          setState(() {
            res4 += 1.0;
          });
        }
      },
    );*/
  }
}
