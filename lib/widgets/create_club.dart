import 'package:flutter/material.dart';
import 'package:stive/dummy/club_data.dart';
import 'package:stive/models/club.dart';

class CreateClub extends StatefulWidget {
  const CreateClub({Key? key}) : super(key: key);

  @override
  State<CreateClub> createState() => _CreateClubState();
}

class _CreateClubState extends State<CreateClub> {
  String? name, description, logoUrl;
  final _form = GlobalKey<FormState>();
  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    DUMMY_CLUB.add(Club(
        id: "id",
        name: name!,
        description: description!,
        logoUrl: logoUrl!,
        coordinators: [],
        members: [],
        posts: []));
    Navigator.of(context).pop();
  }

  Widget buildName() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Name', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Name is required';
      },
      onSaved: (String? value) {
        name = value;
      },
    );
  }

  Widget buildDescription() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Description',
        labelStyle: TextStyle(color: Colors.white),
      ),
      maxLines: 3,
      validator: (String? value) {
        if (value!.isEmpty) return 'Description is required';
      },
      onSaved: (String? value) {
        description = value;
      },
    );
  }

  Widget buildLogoUrl() {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelText: 'Logo Url', labelStyle: TextStyle(color: Colors.white)),
      validator: (String? value) {
        if (value!.isEmpty) return 'Logo Url is required';
      },
      onSaved: (String? value) {
        logoUrl = value;
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
