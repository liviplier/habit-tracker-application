import 'package:flutter/material.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/screens/widgets/hero_dialog_route.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  TimeOfDay _timeOfDay =
      const TimeOfDay(hour: 0, minute: 00); // send to database
  timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _heroReminderCard,
      child: timePicker(),
    );
  }
}

String _heroReminderCard = 'add-hero';

class ReminderButton extends StatelessWidget {
  const ReminderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(
            builder: (context) {
              return const ReminderScreen();
            },
          ));
        },
        child: Hero(
          tag: _heroReminderCard,
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
