// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({Key? key}) : super(key: key);
  static Route get route => MaterialPageRoute(
        builder: (context) => const UserSetting(),
      );
  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  final user = FirebaseAuth.instance.currentUser?.email;
  final useremail = FirebaseAuth.instance.currentUser?.email;

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  String picture = "";
  bool change = false;
  Future findProfilePic() async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(useremail)
          .get()
          .then((snapshot) => {picture = snapshot.data()!["profilePicURL"]});
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findProfilePic();
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final destination = 'username/$user';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('${user}_profile_Picture/');
      await ref.putFile(_photo!);
    } catch (e) {
      // ignore: avoid_print
      print('error occured');
    }

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('${user}_profile_Picture/');
      final String downloadUrl = await ref.getDownloadURL();
      // CollectionReference users = FirebaseFirestore.instance.collection("users");
      // use
      await FirebaseFirestore.instance
          .collection("users")
          .doc(useremail)
          .update({"profilePicURL": downloadUrl});
    } catch (e) {
      // ignore: avoid_print
      print('error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text(
          "User setting",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 140,
            ),
            imageProfile(),
            // const SizedBox(
            //   height: 50,
            // ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                          20, 10, 20, 10) // Background color
                      ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    uploadFile();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)
                      // Background color
                      ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          FutureBuilder(
              future: findProfilePic(),
              builder: (context, snapshot) {
                return CircleAvatar(
                    radius: 80.0,
                    // backgroundImage: _photo == null
                    //     ? const AssetImage('assets/images/user1.png') as ImageProvider
                    //     : FileImage(File(_photo!.path))),
                    //
                    // backgroundImage: picture == ""
                    //     ? const AssetImage('assets/images/user1.png')
                    //         as ImageProvider
                    //     : NetworkImage(picture));

                    //       backgroundImage: _photo == null
                    //           ? NetworkImage(picture)
                    //           : FileImage(File(_photo!.path)) as ImageProvider);
                    // }),
                    backgroundImage: choosePic());
              }),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: this.context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: const Text("Gallery"),
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        // uploadFile();
      } else {
        // ignore: avoid_print
        print('No image selected');
      }
    });
  }

  choosePic() {
    if (picture == "" && _photo == null) {
      return const AssetImage('assets/images/user1.png');
    } else if (_photo == null) {
      return NetworkImage(picture);
    } else {
      return FileImage(File(_photo!.path));
    }
  }
  // choosePic() {
  //   if (_photo == null) {
  //     return NetworkImage(picture);
  //   } else {
  //     return FileImage(File(_photo!.path));
  //   }
  // }
}
