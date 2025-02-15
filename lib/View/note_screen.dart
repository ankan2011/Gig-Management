import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/Controller/FIrebase_note_controller.dart';
import 'package:note_application/Controller/notes_controllers.dart';
import 'package:note_application/Model/notes_nodel.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final controller = Get.put(FirebaseNoteController());

    final arg = Get.arguments != null ?Get.arguments as Map
        : {
      'isUpdate' : false,
      'note' : null
    };

    final bool isUpdate = arg['isUpdate'] ?? false;
    final note = arg['note'] == null ? null : arg['note'] as QueryDocumentSnapshot<Map<String, dynamic>>;
   // final int? index = arg['index'] == null ? null : arg['index'] as int;

   // DateTime createDate = arg['note'] == null ? DateTime.now() : (note!['create_date'] as Timestamp).toDate();
    final titleController = TextEditingController(
      text: isUpdate ? note!['title'] : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!['description'] : null
    );


    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Custom_color.backgroundColor,
        bottom: PreferredSize(preferredSize: Size.fromHeight(1),
            child: Divider()),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.link)),
            IconButton(onPressed: (){}, icon: Icon(Icons.share)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
          ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: titleController,
             style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold,
             ),
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Title",
                border: InputBorder.none
              ),
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                maxLines: 50,

                decoration: InputDecoration(
                  border: InputBorder.none,
              
                  hintText: "Describe about your notes"
                ),
              ),
            ),
            


          ],
        ),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
                  onPressed: (){
                    if(titleController.text.isEmpty || descriptionController.text.isEmpty){
                      Get.snackbar('Error', "Title and description required",
                           );
                    }else{
                      isUpdate ?
                      controller.updateNotes(
                        note!.id,
                        NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                       // createDate: note!['create_date'],
                       // updateDate: DateTime.now()
                        ))
                       : controller.addNotes(
                          NotesModel(
                              title: titleController.text,
                              description: descriptionController.text,
                              // createDate: DateTime.now()
                          ));
                      Get.back();
                    }
                  },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue
          ),child: Text(
          "Save Changes",
          style: TextStyle(
            color: Colors.white
          ),
        )),
      )

    );
  }
}
