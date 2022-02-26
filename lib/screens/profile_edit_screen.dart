import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:habit_tracker/app_colors.dart';
import 'package:habit_tracker/screens/widgets/theme_changer.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

bool isVisible = false;
var firebaseUser = FirebaseAuth.instance.currentUser;
final formKey = GlobalKey<FormBuilderState>();

class _ProfileEditState extends State<ProfileEdit> {
  // File _image;
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

  var firebaseUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
      .collection('project-7335143326376')
      .snapshots();

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
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: StreamBuilder(
                        stream: _userStream,
                        builder: (context, snapshot) {
                          final String? src = firebaseUser!.photoURL;
                          return Image.network(
                            src!,
                            width: 128,
                            height: 128,
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: ClipOval(
                    child: GestureDetector(
                      onTap: () {
                        // Image.file(_image); // opens gallery??
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
          FormBuilder(
            key: formKey,
            child: Column(
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
                  onChanged: (name) {
                    firebaseUser!.updateDisplayName(name);
                  },
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
                  onChanged: (email) {
                    firebaseUser!.updateEmail(email);
                  },
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
                Visibility(
                  visible: false,
                  replacement: TextButton(
                    child: const Text("Change Passowrd"),
                    onPressed: () {
                      isVisible = !isVisible;
                    },
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    controller: controller,
                    onChanged: (password) {
                      firebaseUser!.updatePassword(password);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        child: const Text("Apply Changes"),
                        onPressed: () {
                          //
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        child: const Text("Delete Account"),
                        onPressed: () {
                          AlertDialog(
                            title: const Text("Are you sure?"),
                            content: const Text(
                                "Are you sure you want to delete your account"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  firebaseUser!.delete();
                                },
                                child: const Text("Yes"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Future getImage() async {
//   var image = await ImagePicker.pickImage(source: ImageSouece.gallery);
//   setState(() {
//     _image = image;
//   });
// }
