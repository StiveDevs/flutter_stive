import 'package:flutter/material.dart';
import 'package:stive/api/clubCalls.dart';
import 'package:stive/constants/misc.dart';
import 'package:stive/models/club.dart';
import 'package:stive/models/student.dart';
import 'package:stive/widgets/misc_widgets.dart';

class CreateClub extends StatefulWidget {
  Student curr;
  CreateClub({Key? key, required this.curr}) : super(key: key);

  @override
  State<CreateClub> createState() => _CreateClubState();
}

class _CreateClubState extends State<CreateClub> {
  String name = "", description = "", logoUrl = "";
  final _form = GlobalKey<FormState>();
  void _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();

    Club created = Club(
        name: name,
        description: description,
        coordinators: [widget.curr],
        members: [],
        posts: []);

    bool res = await createClub(created);
    if (res) {
      Navigator.of(context).pop();
      infoSnackBar("Created Club", context);
    } else {
      errorSnackBar("Error creating Club", context);
    }
  }

  Widget buildName() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration:
          textInputDecoration.copyWith(label: const Text("Name"), hintText: ""),
      validator: (String? value) {
        if (value!.isEmpty) return 'Name is required';
      },
      onSaved: (String? value) {
        name = value ?? "";
      },
    );
  }

  Widget buildDescription() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: textInputDecoration.copyWith(
          label: const Text("Description"), hintText: ""),
      maxLines: 3,
      validator: (String? value) {
        if (value!.isEmpty) return 'Description is required';
      },
      onSaved: (String? value) {
        description = value ?? "";
      },
    );
  }

  Widget buildLogoUrl() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: textInputDecoration.copyWith(
          label: const Text("Logo Url"), hintText: ""),
      validator: (String? value) {
        if (value!.isEmpty) return 'Logo Url is required';
      },
      onSaved: (String? value) {
        logoUrl = value ?? "";
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Club'),
      ),
      body: Form(
          key: _form,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              buildName(),
              const SizedBox(
                height: 35,
              ),
              buildDescription(),
              const SizedBox(
                height: 35,
              ),
              buildLogoUrl()
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _saveForm();
        }),
        child: const Icon(Icons.check),
      ),
    );
  }
}
