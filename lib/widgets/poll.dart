import 'package:polls/polls.dart';
import 'package:flutter/material.dart';

class PollWidget extends StatefulWidget {
  const PollWidget({Key? key}) : super(key: key);

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  double option1 = 2.0;
  double option2 = 1.0;
  double option3 = 4.0;
  double option4 = 3.0;
  String user = "user@gmail.com";
  Map usersWhoVoted = {
    'test@gmail.com': 1,
    'deny@gmail.com': 3,
    'kent@gmail.com': 2,
    'xyz@gmail.com': 3
  };
  String creator = "admin@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Polls(
      children: [
        // This cannot be less than 2, else will throw an exception
        Polls.options(title: 'State Management', value: option1),
        Polls.options(title: 'User Authentication', value: option2),
        Polls.options(title: 'Firebase Integration', value: option3),
        Polls.options(title: 'Basics', value: option4),
      ],
      question: Text(
        'What concept do you want to learn through this session ? ',
        style: TextStyle(color: Colors.white),
      ),
      currentUser: this.user,
      creatorID: this.creator,
      voteData: usersWhoVoted,
      userChoice: usersWhoVoted[this.user],
      onVoteBackgroundColor: Colors.blue,
      leadingBackgroundColor: Colors.blue,
      backgroundColor: Colors.white,
      onVote: (choice) {
        setState(() {
          this.usersWhoVoted[this.user] = choice;
        });
        if (choice == 1) {
          setState(() {
            option1 += 1.0;
          });
        }
        if (choice == 2) {
          setState(() {
            option2 += 1.0;
          });
        }
        if (choice == 3) {
          setState(() {
            option3 += 1.0;
          });
        }
        if (choice == 4) {
          setState(() {
            option4 += 1.0;
          });
        }
      },
    );
  }
}
