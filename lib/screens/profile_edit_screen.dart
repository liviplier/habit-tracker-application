import 'package:flutter/material.dart';
import 'package:habit_tracker/app_colors.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? AppColors.darkText1 : AppColors.lightText1,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Stack(
              children: [
                const ClipOval(
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
                        // open gallery
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: AppColors.mainColor,
                        child: const Icon(
                          Icons.add_a_photo,
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
          Column(
            children: [
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 10,
                  color: isDark ? AppColors.darkText2 : AppColors.lightText2,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                controller: controller,
                onChanged: (name) {},
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 10,
                  color: isDark ? AppColors.darkText2 : AppColors.lightText2,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                controller: controller,
                onChanged: (email) {},
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 10,
                  color: isDark ? AppColors.darkText2 : AppColors.lightText2,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                controller: controller,
                onChanged: (passwrod) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
