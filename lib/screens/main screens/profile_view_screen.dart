// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/cubit/auth_cubit.dart';
import 'package:habit_tracker/screens/profile_edit_screen.dart';
import 'package:habit_tracker/screens/widgets/buttons.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: Image(
                      image: NetworkImage(""), // get image from database
                      width: 128,
                      height: 128,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: ClipOval(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ProfileEdit()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: AppColors.mainColor,
                        child: Icon(
                          Icons.edit,
                          color: AppColors.darkText1,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Name",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: isDark ? AppColors.darkText2 : AppColors.lightText2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 30,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkText2 : AppColors.lightText2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "", // name from database
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: isDark ? AppColors.darkText1 : AppColors.lightText1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Email",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: isDark ? AppColors.darkText2 : AppColors.lightText2,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.maxFinite,
            height: 30,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkText2 : AppColors.lightText2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "", // email from database
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: isDark ? AppColors.darkText1 : AppColors.lightText1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Dark Mode"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Switch(
                  activeColor: AppColors.mainColor,
                  value: isDark,
                  onChanged: (isDarkMode) {
                    isDark = !isDark;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: ButtonWidget(
              width: 144,
              onPressed: () {},
              text: "Logout",
            ),
          ) // logout
        ],
      ),
    );
  }
}

class UserDetials {
  final String imagePath;
  final String name;
  final String email;
  final bool isDarkMode;

  UserDetials({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.isDarkMode,
  });
}
