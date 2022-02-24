// import 'package:flutter/material.dart';

class HabitDetails {
  String uid;
  String habitName;
  int timesPerDay;
  int? daysPerWeek;
  int timeOfDay;
  HabitDetails({
    required this.uid,
    required this.habitName,
    required this.timeOfDay,
    required this.timesPerDay,
  });
}

class HabitList {
  List<HabitDetails> habitList;
  HabitList({required this.habitList});
}
