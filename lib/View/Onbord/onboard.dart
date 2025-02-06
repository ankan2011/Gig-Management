import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {

  // Future writeData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('is_first_time', false);
  //   print("Data stored sucess");
  // }
  //
  // Future readData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final isFirstTime = prefs.getBool("is_first_time") ?? true;
  //   print("Is First time $isFirstTime");
  // }



  @override
  void initState() {
    super.initState();
    // writeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Text("This is onBoard Screen",
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20
       ),),
     ),
    );
  }
}
