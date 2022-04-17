import 'package:polls/polls.dart';
import 'package:flutter/material.dart';
import 'package:stive/models/option.dart';
import 'package:stive/models/pollModel.dart';
import 'package:stive/models/student.dart';

class PollWidget extends StatefulWidget {
  final PollModel poll;
  final Student curr;
  const PollWidget({Key? key, required this.poll, required this.curr})
      : super(key: key);

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  // double option1 = 2.0;
  // double option2 = 1.0;
  // double option3 = 4.0;
  // double option4 = 3.0;
  List<Option>? optionList;
  String? user;
  @override
  void initState() {
    optionList = widget.poll.options;
    user = widget.curr.email;
  }

  Map usersWhoVoted = Map();
  Map userVotingdata() {
    int cnt = 1;
    for (var option in optionList!) {
      for (var student in option.selectedBy) {
        usersWhoVoted[student.email] = cnt;
      }
      cnt++;
    }
    return usersWhoVoted;
  }

  String creator = "admin@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Polls(
        children: [
          // This cannot be less than 2, else will throw an exception
          ...optionList!
              .map((option) => Polls.options(
                  title: option.name,
                  value: optionList!
                      .indexWhere((element) => element == option)
                      .toDouble()))
              .toList(),
        ],
        question: Text(
          widget.poll.name,
          style: const TextStyle(color: Colors.white),
        ),
        currentUser: user,
        creatorID: creator,
        voteData: userVotingdata(),
        userChoice: usersWhoVoted[user],
        onVoteBackgroundColor: Colors.blue,
        leadingBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        onVote: (choice) {
          print(choice);
          setState(() {
            usersWhoVoted[user] = choice;
            optionList![choice - 1].selectedBy.add(widget.curr);
          });
        });
  }
}
