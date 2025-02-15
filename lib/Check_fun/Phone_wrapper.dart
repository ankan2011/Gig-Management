
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_application/View/home.dart';

import '../EmailAuth/home.dart';
import '../EmailAuth/login.dart';
import '../PhoneAuth/PhoneLogin.dart';


class PhoneWrapper extends StatefulWidget {
  const PhoneWrapper({super.key});

  @override
  State<PhoneWrapper> createState() => _PhoneWrapperState();
}

class _PhoneWrapperState extends State<PhoneWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return HomePage();  // Email is verified, navigate to HomePage
                } else {
                  return PhoneLogin();  // Email is not verified, navigate to VerifyPage
                }
              }

              // else {
              //   // User is not signed in, navigate to PhoneLogin
              //   return LoginPage();
              // }
            // }

            )
    );
  }
}
