// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/app_theme.dart';
//
// import '../widgets/widgets.dart';
//
// class UserProfile extends StatelessWidget {
//   static Route get route => MaterialPageRoute(
//         builder: (context) => const UserProfile(),
//       );
//
//   const UserProfile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final borderRadius = BorderRadius.circular(20);
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: ExactAssetImage('assets/images/image1.jpg'),
//           opacity: 0.9,
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: const Text('Profile'),
//           backgroundColor: Colors.transparent,
//           centerTitle: true,
//           leading: Center(
//             child: IconBackground(
//               icon: Icons.arrow_back_ios_new,
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Center(
//                 child: IconBackground(
//                     icon: Icons.settings,
//                     onTap: () {
//                       print('Setting');
//                     }),
//               ),
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: EdgeInsets.only(top: 240),
//           child: Container(
//             padding: EdgeInsets.only(top: 32, left: 16, right: 16),
//             height: double.maxFinite,
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor, // 首页列表背景色 <=========
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Row(
//                         children: [
//                           Hero(
//                             tag: 'hero-profile-picture',
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                   borderRadius: borderRadius),
//                               child: ClipRRect(
//                                 borderRadius: borderRadius,
//                                 child: SizedBox.fromSize(
//                                   size: Size.fromRadius(32),
//                                   child: Image.asset(
//                                     'assets/images/user1.png',
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(
//                                 'Anna Wang',
//                                 style: MyTheme.senderName,
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'ID: 12345',
//                                 style: MyTheme.textTime,
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           print('edit profile');
//                         },
//                         child: Icon(Icons.arrow_forward_ios_rounded))
//                   ],
//                 ),
//                 const Divider(
//                   thickness: 1,
//                 ),
//                 const SizedBox(height: 16),
//                 GestureDetector(
//                   onTap: () {
//                     print('change avatar');
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: MyTheme.kPrimaryColor,
//                       borderRadius: borderRadius,
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Change Avatar',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 GestureDetector(
//                   onTap: (() {
//                     print('change voice');
//                   }),
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: MyTheme.kPrimaryColor,
//                       borderRadius: borderRadius,
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Custome Voice',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 MaterialButton(
//                   onPressed: () {
//                     FirebaseAuth.instance.signOut();
//                   },
//                   color: Colors.deepPurple[200],
//                   child: Text('sign out'),
//                 )
//                 // TextButton(
//                 //   onPressed: () {
//                 //     print('Sign out');
//                 //   },
//                 //   child: const Text('Sign out'),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/app_theme.dart';

import '../widgets/widgets.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static Route get route => MaterialPageRoute(
        builder: (context) => const UserProfile(),
      );

  @override
  State<UserProfile> createState() => _UserProfileState();
}
  class _UserProfileState extends State<UserProfile> {
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
    }
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/image1.jpg'),
          opacity: 0.9,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: Center(
            child: IconBackground(
              icon: Icons.arrow_back_ios_new,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: IconBackground(
                    icon: Icons.settings,
                    onTap: () {
                      print('Setting');
                    }),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 240),
          child: Container(
            padding: EdgeInsets.only(top: 32, left: 16, right: 16),
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor, // 首页列表背景色 <=========
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Hero(
                            tag: 'hero-profile-picture',
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: borderRadius),
                              child: ClipRRect(
                                borderRadius: borderRadius,
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(32),
                                  child: Image.asset(
                                    'assets/images/user1.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Anna Wang',
                                style: MyTheme.senderName,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'ID: 12345',
                                style: MyTheme.textTime,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          print('edit profile');
                        },
                        child: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    print('change avatar');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MyTheme.kPrimaryColor,
                      borderRadius: borderRadius,
                    ),
                    child: const Center(
                      child: Text(
                        'Change Avatar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: (() {
                    print('change voice');
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MyTheme.kPrimaryColor,
                      borderRadius: borderRadius,
                    ),
                    child: const Center(
                      child: Text(
                        'Custome Voice',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                MaterialButton(
                  onPressed: () {
                    _signOut();
                    Navigator.pop(context);
                  },
                  color: Colors.deepPurple[200],
                  child: Text('sign out'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  }


