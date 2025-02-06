import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/Controller/notes_controllers.dart';
import 'package:note_application/View/note_screen.dart';

import '../widget/custom_single_note.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(NotesController());


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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
             Obx(() =>  Expanded(
               child: controller.notes.isEmpty ?
               Center(child: Text("No Notes Available!"))
                   :ListView.builder(
                 shrinkWrap: true,
                 primary: false,
                // reverse: true,
                 itemCount: controller.notes.length,
                 itemBuilder: (context, index) {

                   return CustomSingleNote(index: index,


                   );
                 },),
             ),)
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
    );
  }
}


