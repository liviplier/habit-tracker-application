import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/cubit/app_cubit.dart';
import 'package:habit_tracker/screens/popup%20screens/reminders_screen.dart';
import 'package:habit_tracker/screens/widgets/hero_dialog_route.dart';
import 'package:habit_tracker/screens/widgets/theme_changer.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormBuilderState>();

  visible() {
    if (often[1] == true) {
      setState(() {
        isVisible = !isVisible;
      });
    }
  }

  bool isVisible = false;
  int num = 0;
  List<bool> often = [
    true,
    false,
    false,
  ];
  List<bool> week = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> timeofDay = [
    true,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is EditHabitState) {
          //display info
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Hero(
              tag: _heroEditHabit,
              child: Material(
                color: AppColors.mainColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: FormBuilder(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Positioned(
                          right: 5,
                          top: 5,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: FormBuilderTextField(
                            textInputAction: TextInputAction.next,
                            name: "name",
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              hintText: "Enter habit name",
                              hintStyle: kHintStyle,
                              filled: true,
                              fillColor: AppColors.mainColor.withOpacity(0.5),
                              enabledBorder: kOutlineBorder,
                              focusedBorder: kOutlineBorder,
                              errorBorder: kErrorOutlineBorder,
                              focusedErrorBorder: kErrorOutlineBorder,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: double.maxFinite,
                          height: 20,
                          child: Column(
                            children: [
                              Text(
                                "How often do you want to do it",
                                style: TextStyle(
                                    color: isDark
                                        ? AppColors.darkText2
                                        : AppColors.lightText2,
                                    fontSize: 20),
                              ),
                              FormBuilderField(
                                name: 'often',
                                builder: (field) {
                                  return ToggleButtons(
                                      borderRadius: BorderRadius.circular(50),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Daily",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Weekly",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Monthly",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                      isSelected: often,
                                      onPressed: (int newIndex) {
                                        setState(() {
                                          for (int index = 0;
                                              index < often.length;
                                              index++) {
                                            if (index == newIndex) {
                                              often[index] = true;
                                            } else {
                                              often[index] = false;
                                            }
                                          }
                                        });
                                      });
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: double.maxFinite,
                          height: 20,
                          child: Column(
                            children: [
                              Text(
                                "How many times per day",
                                style: TextStyle(
                                    color: isDark
                                        ? AppColors.darkText2
                                        : AppColors.lightText2,
                                    fontSize: 20),
                              ),
                              FormBuilderField(
                                name: 'perday',
                                builder: (field) {
                                  return Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (num > 0) {
                                                num--;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.minimize_outlined,
                                            size: 16,
                                            color: isDark
                                                ? AppColors.darkText1
                                                : AppColors.lightText1,
                                          )),
                                      Text(
                                        num.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: isDark
                                                ? AppColors.darkText1
                                                : AppColors.lightText1),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            num++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.minimize_outlined,
                                          size: 16,
                                          color: isDark
                                              ? AppColors.darkText1
                                              : AppColors.lightText1,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Visibility(
                          visible: visible(),
                          replacement: const SizedBox.shrink(),
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            width: double.maxFinite,
                            height: 20,
                            child: Column(
                              children: [
                                Text(
                                  "What days per week",
                                  style: TextStyle(
                                      color: isDark
                                          ? AppColors.darkText2
                                          : AppColors.lightText2,
                                      fontSize: 20),
                                ),
                                FormBuilderField(
                                    name: 'perweek',
                                    builder: (field) {
                                      return ToggleButtons(
                                        borderRadius: BorderRadius.circular(50),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Mon",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Tue",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Wed",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Thur",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Fri",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Sat",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "Sun",
                                              style: TextStyle(
                                                color: isDark
                                                    ? AppColors.darkText1
                                                    : AppColors.lightText1,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                        isSelected: week,
                                        onPressed: (int newIndex) {
                                          final isOneSelected = week
                                                  .where((element) => element)
                                                  .length ==
                                              1;
                                          if (isOneSelected && week[newIndex]) {
                                            return;
                                          }
                                          setState(() {
                                            for (int index = 0;
                                                index < week.length;
                                                index++) {
                                              if (index == newIndex) {
                                                week[index] = !week[index];
                                              }
                                            }
                                          });
                                        },
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: double.maxFinite,
                          height: 20,
                          child: Column(
                            children: [
                              Text(
                                "What time of day",
                                style: TextStyle(
                                    color: isDark
                                        ? AppColors.darkText2
                                        : AppColors.lightText2,
                                    fontSize: 20),
                              ),
                              FormBuilderField(
                                  name: 'timeOfDay',
                                  builder: (field) {
                                    return ToggleButtons(
                                      borderRadius: BorderRadius.circular(50),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Morning",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Afternoon",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            "Eveing",
                                            style: TextStyle(
                                              color: isDark
                                                  ? AppColors.darkText1
                                                  : AppColors.lightText1,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                      isSelected: timeofDay,
                                      onPressed: (int newIndex) {
                                        setState(() {
                                          for (int index = 0;
                                              index < timeofDay.length;
                                              index++) {
                                            if (index == newIndex) {
                                              often[index] = true;
                                            } else {
                                              often[index] = false;
                                            }
                                          }
                                        });
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(HeroDialogRoute(
                                builder: (_) => const ReminderScreen()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Set Reminder",
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            child: const Text("Apply"),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final appCubit =
                                    BlocProvider.of<AppCubit>(context);
                                await appCubit.editHabit(
                                  formKey.currentState!.fields['name']?.value,
                                  formKey.currentState!.fields['often']?.value,
                                  formKey.currentState!.fields['perDay']?.value,
                                  formKey
                                      .currentState!.fields['perWeek']?.value,
                                  formKey
                                      .currentState!.fields['timeOfDay']?.value,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

String _heroEditHabit = 'edit-hero';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const EditScreen();
            },
          ));
        },
        child: Hero(
          tag: _heroEditHabit,
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

const kHintStyle = TextStyle(fontSize: 13, letterSpacing: 1.2);

var kOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.transparent),
);

var kErrorOutlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Colors.red),
);

const kLoaderBtn = SizedBox(
  height: 20,
  width: 20,
  child: CircularProgressIndicator(
    strokeWidth: 1.5,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  ),
);
