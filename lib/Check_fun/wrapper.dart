
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:note_application/View/home.dart';

import '../EmailAuth/home.dart';
import '../EmailAuth/login.dart';
import '../EmailAuth/verify.dart';

class WrapperState extends StatefulWidget {
  const WrapperState({super.key});

  @override
  State<WrapperState> createState() => _WrapperStateState();
}

class _WrapperStateState extends State<WrapperState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is signed in, check if email is verified
            if (snapshot.data!.emailVerified) {
              return HomePage();  // Email is verified, navigate to HomePage
            } else {
              return VerifyPage();  // Email is not verified, navigate to VerifyPage
            }
          }

          else {
            // User is not signed in, navigate to PhoneLogin
            return LoginPage();
          }
        },

      ),
      // body: StreamBuilder(
      //         stream: FirebaseAuth.instance.authStateChanges(),
      //         builder: (context,snapshot)
      //         {
      //
      //           if(snapshot.hasData){
      //
      //               return HomePage();
      //
      //           else {
      //             return LoginPage();
      //           }
      //
      //           }
      //       )
    );
  }
}
