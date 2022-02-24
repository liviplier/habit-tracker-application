import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/cubit/app_cubit.dart';
import 'package:habit_tracker/screens/popup%20screens/habit_edit_screen.dart';
import 'package:habit_tracker/screens/widgets/hero_dialog_route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> info = [];
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkMode : AppColors.lightMode,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                    color: isDark ? AppColors.darkText2 : AppColors.lightText1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/icons/home.png"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Active Habits"),
          ),
          Container(
            width: 200,
            height: double.maxFinite,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: info.length, //habit length
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).detailScreen(info);
                        },
                        child: Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                if (state is HomeLoadedState) {
                                  var info = state.habits;
                                  return Text(
                                    info[index]
                                        .toString(), // name .name not toStrin
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: isDark
                                            ? AppColors.darkText2
                                            : AppColors.lightText2),
                                  );
                                } else {
                                  return Center(
                                    child: Text(
                                      "You don't have any habits!",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: isDark
                                              ? AppColors.darkText1
                                              : AppColors.lightText1),
                                    ),
                                  );
                                }
                              },
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        elevation: 3,
        onPressed: () {
          Navigator.of(context)
              .push(HeroDialogRoute(builder: (_) => EditScreen()));
        },
        tooltip: 'Create Habit',
        child: Icon(
          Icons.add,
          color: isDark ? AppColors.lightText1 : AppColors.darkText1,
        ),
      ),
    );
  }
}
