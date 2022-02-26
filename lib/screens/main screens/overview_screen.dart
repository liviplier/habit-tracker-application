import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:fl_chart/fl_chart.dart';

var firebaseUser = FirebaseAuth.instance.currentUser;
FirebaseFirestore firestore = FirebaseFirestore.instance;
final Stream<QuerySnapshot> _habitStream =
    FirebaseFirestore.instance.collection('project-7335143326376').snapshots();

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);
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
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(148, 180, 255, 1),
                ),
                child: const LiveChart(),
              ),
              Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(148, 180, 255, 1),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/confetti.png"),
                        Text(
                          snapshot.data!.docs[3][
                              'currentStreak'], // from database (not there yet)
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightText1,
                          ),
                        ),
                        const Text(
                          'Current Streak',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: AppColors.lightText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(148, 180, 255, 1),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/flame.png"),
                        Text(
                          snapshot.data!.docs[3]
                              ['longestStreak'], // from database
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Longest Streak',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(148, 180, 255, 1),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/crown.png"),
                        Text(
                          snapshot.data!.docs[3]['completedHabits'] + 'HABITS',
                          //from database
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Habits Completed',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(148, 180, 255, 1),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/chat-arrow-grow.png"),
                        Text(
                          snapshot.data!.docs[3]['rate'], // from database
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          'Completion Rate',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 4, // change to non static value
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    child: const Text(
                                      "",
                                      // from database
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.lightText2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  _LiveChartState createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
