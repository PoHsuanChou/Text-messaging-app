import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app_theme.dart';
import 'package:untitled/pages/pages.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:untitled/screens/screens.dart';
import 'package:untitled/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = [
    FloatingNavbarItem(icon: CupertinoIcons.ellipses_bubble),
    FloatingNavbarItem(icon: CupertinoIcons.list_bullet),
  ];
  final pages = const [
    HomeChat(),
    HomeList(),
  ];
  int currentIndex = 0;
  final pageController = PageController();
  String picture = "";
  final useremail = FirebaseAuth.instance.currentUser?.email;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  choosePic() {
    if (picture == "") {
      return const AssetImage('assets/images/user1.png');
    } else {
      return NetworkImage(picture);
    }
  }
  // choosePic() {
  //   if (picture == "") {
  //     return 'assets/images/user1.png';
  //   } else {
  //     // return Uri.parse(picture).toString();
  //     return picture.toString();
  //   }
  // }

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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Top App Bar
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // App title
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My',
                style: MyTheme.kAppTitle1,
              ),
              Text(
                ' Chat',
                style: MyTheme.kAppTitle,
              ),
            ],
          ),
        ),

        //top-left add button
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Align(
            alignment: Alignment.centerRight,
            child: IconPure(
              icon: CupertinoIcons.plus_app,
              onTap: () {
                print('TODO Search');
              },
            ),
          ),
        ),

        // top-right user image
        actions: [
          Hero(
            tag: 'hero-profile-picture',
            child: Padding(
              padding: const EdgeInsets.only(right: 24, top: 12),
              // child: CircleAvatar(
              //     radius: 26,
              //     backgroundColor: Color.fromARGB(255, 222, 187, 83),
              //     child: FutureBuilder(
              //         future: findProfilePic(),
              //         builder: (context, snapshot) {
              //           return Avatar.small(
              //             url: choosePic(),
              //             onTap: () {
              //               Navigator.of(context).push(UserProfile.route);
              //             },
              //           );
              //         }))

              // child: CircleAvatar(
              //   radius: 26,
              //   backgroundColor: Color.fromARGB(255, 222, 187, 83),
              //   child: Avatar.small(
              //     url: 'assets/images/user1.png',
              //     onTap: () {
              //       Navigator.of(context).push(UserProfile.route);
              //     },
              //   ),
              // ),

              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(UserProfile.route)
                      .then((_) => setState(() {}));
                },
                child: FutureBuilder(
                    future: findProfilePic(),
                    builder: (context, snapshot) {
                      return CircleAvatar(
                        radius: 30,
                        backgroundImage: choosePic(),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),

      // 背景色
      backgroundColor: Color.fromARGB(255, 131, 155, 210), // 决定主页背景色 《======

      // body pages
      body: Ink(
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // 首页列表背景色 <=========
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          onPageChanged: onPageChanged,
          children: pages,
        ),
      ),

      // Bottom Nav bar
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: FloatingNavbar(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          backgroundColor: Colors.black.withOpacity(0.5),
          width: 200,
          borderRadius: 50,
          itemBorderRadius: 50,
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
