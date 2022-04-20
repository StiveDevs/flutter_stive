import 'package:flutter/material.dart';
import 'package:stive/api/pollCalls.dart';
import 'package:stive/api/postCalls.dart';
import 'package:stive/models/option.dart';
import 'package:stive/models/pollModel.dart';
import 'package:stive/models/post.dart';
import 'package:stive/widgets/misc_widgets.dart';

class PollAdd extends StatefulWidget {
  Post selected;
  PollAdd({Key? key, required this.selected}) : super(key: key);

  @override
  State<PollAdd> createState() => _PollAddState();
}

class _PollAddState extends State<PollAdd> {
  late String question;
  List<Option> optionList = [];
  final _form = GlobalKey<FormState>();
  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    PollModel newPoll = PollModel(name: question, options: optionList);
    bool res = await createPoll(newPoll);
    if (res) {
      res = await addPollToPost(widget.selected.id, newPoll.id);
      if (res) {
        Navigator.of(context).pop();
        infoSnackBar("Created post", context);
      }
    }
    if (!res) {
      errorSnackBar("Error creating post", context);
    }
  }

  Widget buildQuestion() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Question', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Name is required';
      },
      onSaved: (String? value) {
        question = value!;
      },
    );
  }

  Widget buildOptions(int index) {
    return Column(
      children: [
        TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: 'Option $index',
                labelStyle: const TextStyle(color: Colors.white)),
            validator: (String? value) {
              if (value!.isEmpty) return 'Field is empty';
            },
            onSaved: (String? value) {
              optionList.add(Option(name: value!, selectedBy: []));
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Poll'),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              buildQuestion(),
              const SizedBox(
                height: 35,
              ),
              buildOptions(1),
              const SizedBox(
                height: 35,
              ),
              buildOptions(2),
              const SizedBox(
                height: 35,
              ),
              buildOptions(3),
              const SizedBox(
                height: 35,
              ),
              buildOptions(4),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveForm();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
