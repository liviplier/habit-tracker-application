import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/screens/popup%20screens/habit_edit_screen.dart';
import 'package:habit_tracker/screens/widgets/hero_dialog_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewHabit extends StatefulWidget {
  const ViewHabit({Key? key}) : super(key: key);

  @override
  _ViewHabitState createState() => _ViewHabitState();
}

class _ViewHabitState extends State<ViewHabit> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _habitStream = FirebaseFirestore.instance
      .collection('project-7335143326376')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _habitStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Hero(
              tag: _heroViewHabit,
              child: Material(
                color: AppColors.mainColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Positioned(
                        right: 5,
                        top: 5,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(HeroDialogRoute(
                                builder: (_) => const EditScreen()));
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: AppColors.lightText2, fontSize: 10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: double.maxFinite,
                        height: 20,
                        child: Text(
                          snapshot.data!.docs[1]['name'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ), //name
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: double.maxFinite,
                        height: 200,
                        child: Column(
                          children: [
                            const Text(
                              "Habit History",
                              style: TextStyle(
                                  fontSize: 30, color: AppColors.lightText1),
                            ),
                            CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime.utc(1900, 1, 1),
                                lastDate: DateTime.utc(2900, 12, 31),
                                onDateChanged: (value) {}),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            const Text("Feeling Chart"),
                            Slider(
                                min: 1, max: 5, value: 0, onChanged: onChanged),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Completed"),
                            Radio(
                                value: 0, groupValue: 1, onChanged: onCompleted)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<StatefulWidget> onChanged(double value) async {
    double feelingValue;
    feelingValue = value;
    try {
      FirebaseFirestore.instance
          .collection('project-7335143326376')
          .doc('Habit')
          .update({'feelingChart': feelingValue}).then((value) =>
              const SnackBar(
                  content: Text('Successfully Saved'))); //save to database
    } catch (e) {
      return const SnackBar(
        content: Text("Failed to save"),
      );
    }
    return const CircularProgressIndicator();
  }

  void onCompleted(int? value) {
    bool? completed = false;
    int? complete;
    value = complete;
    if (complete == 1) {
      completed = true;
    } else {
      completed = false;
    }
    try {
      setState(() {
        FirebaseFirestore.instance
            .collection('project-7335143326376')
            .doc('Habit')
            .update({'completed': completed});
      });
      const SnackBar(content: Text('Successfully Saved')); // makes it true
    } catch (e) {
      const SnackBar(
        content: Text("Failed to save"),
      );
    }
  }
}

String _heroViewHabit = 'view-hero';

class ViewButton extends StatelessWidget {
  const ViewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const ViewHabit();
            },
          ));
        },
        child: Hero(
          tag: _heroViewHabit,
          child: Material(
            color: AppColors.mainColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}
