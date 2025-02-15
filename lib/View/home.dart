import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/Controller/FIrebase_note_controller.dart';
import 'package:note_application/Controller/notes_controllers.dart';
import 'package:note_application/View/note_screen.dart';

import '../widget/custom_single_note.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =  Get.put(FirebaseNoteController());

    final user = FirebaseAuth.instance.currentUser;

    signout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child:
          Column(
            children: [
              Text("My Notes",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),),
              Text("Welcome , ${user!.email}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    //  IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                      IconButton(onPressed: (){
                        signout();
                      }, icon: Icon(Icons.login,color: Colors.red,)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
             Expanded(
               // child: controller.notes.isEmpty ?
               // Center(child: Text("No Notes Available!"))
               //     :
               child:
               StreamBuilder(
                   stream: controller.fireStore.collection("notes").snapshots(),
                   builder: (context,snapshot){
                     if(snapshot.connectionState == ConnectionState.waiting){
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }else if (snapshot.hasError ){
                       return Text(snapshot.error.toString());
                     }else{
                       // print(snapshot.data!.docs.length);
                       // return Text("get data");
                       return ListView.builder(
                         shrinkWrap: true,
                         primary: false,
                        reverse: false,
                         itemCount: snapshot.data!.docs.length,
                         itemBuilder: (context, index) {
                           final data = snapshot.data!.docs[index];

                           return CustomSingleNote(
                              index: index,
                             data: data,
                           );
                         },);
                     }
                   })
             ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
          backgroundColor: Custom_color.primaryColor,
          onPressed: (){
          Get.to(NoteScreen());
          },
        child: Icon(Icons.add,color: Colors.white,),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


