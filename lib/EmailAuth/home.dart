//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final user = FirebaseAuth.instance.currentUser;
//
//   signout() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Home Page"),
//           centerTitle: true,
//           // actions: [
//           //   InkWell(
//           //       onTap: (){
//           //         Get.to(AddPost());
//           //       },
//           //       child: Icon(Icons.add)),
//           //
//           // ],
//         ),
//         body: Column(
//           mainAxisAlignment:MainAxisAlignment.spaceBetween,
//             children: [
//
//               Center(child: Text("Welcome , ${user!.email}")),
//               Center(child: Text("Welcome , ${user!.phoneNumber}")),
//
//     ],
//     ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:  (()=>signout()),child: Icon(Icons.login_rounded,color: Colors.red,),
//       ),
//
//
//     );
//   }
// }
