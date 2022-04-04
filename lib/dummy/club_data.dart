import 'package:flutter/material.dart';
import 'package:stive/dummy/post_data.dart';
import 'package:stive/dummy/student_data.dart';
import 'package:stive/models/club.dart';

// String id, name, description, logoUrl;
//   List<Student> coordinators, members;
//   List<Post> posts;
var DUMMY_CLUB = [
  Club(
      id: "1",
      name: "Afsaane",
      description: "Music Club",
      coordinators: [DUMMY_STUDENTS[0], DUMMY_STUDENTS[1]],
      members: [DUMMY_STUDENTS[2], DUMMY_STUDENTS[3]],
      posts: [DUMMY_POST[3]]),
  Club(
      id: "2",
      name: "Alankrit",
      description: "Fine Arts Club",
      coordinators: [DUMMY_STUDENTS[1], DUMMY_STUDENTS[2]],
      members: [DUMMY_STUDENTS[3], DUMMY_STUDENTS[4]],
      posts: [DUMMY_POST[2]]),
  Club(
      id: "3",
      name: "BioScope",
      description: "Movie Club",
      coordinators: [DUMMY_STUDENTS[2], DUMMY_STUDENTS[3]],
      members: [DUMMY_STUDENTS[4], DUMMY_STUDENTS[5]],
      posts: []),
  Club(
      id: "4",
      name: "Avant",
      description: "Programming Club",
      coordinators: [DUMMY_STUDENTS[3], DUMMY_STUDENTS[4]],
      members: [DUMMY_STUDENTS[5], DUMMY_STUDENTS[0]],
      posts: [DUMMY_POST[0], DUMMY_POST[4]]),
  Club(
      id: "5",
      name: "D-Dazzlers",
      description: "Dance Club",
      coordinators: [DUMMY_STUDENTS[4], DUMMY_STUDENTS[5]],
      members: [DUMMY_STUDENTS[0], DUMMY_STUDENTS[1]],
      posts: [DUMMY_POST[2]]),
];
