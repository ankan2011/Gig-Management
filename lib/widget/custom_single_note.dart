import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/Controller/FIrebase_note_controller.dart';
import 'package:note_application/Controller/notes_controllers.dart';
import 'package:note_application/View/note_screen.dart';

class CustomSingleNote extends StatelessWidget {

  final int index;
  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  const CustomSingleNote({
    super.key,
    required this.index,
    required this.data});

  @override
  Widget build(BuildContext context) {

  final controller = Get.put(FirebaseNoteController() );

  final note = data;

  //
  //
  // DateTime createDate = (note['create_date'] as Timestamp).toDate();
  // DateTime? updateDate = (note['update_date'] as Timestamp).toDate() ?? DateTime.now();


  // DateTime createDate = (note['create_date'] as Timestamp).toDate();
  // // DateTime updateDate = (note['create_date'] as Timestamp).toDate();
  // DateTime updateDate = note["update_date"] == null ?   DateTime.now() : (note['update_date'] as Timestamp).toDate();

  // final createdDateFormat = DateFormat.yMMMMd().format(createDate);
  // final createdTimeFormat = DateFormat.jm().format(createDate);
  //
  // final updateDateFormat = DateFormat.yMMMMd().format(updateDate  ?? DateTime.now() );
  // final updateTimeFormat = DateFormat.jm().format(updateDate ?? DateTime.now());

  // final createdDateFormat = DateFormat.yMMMMd().format(note['create_date']);
  // final createdTimeFormat = DateFormat.jm().format(note['create_date']);
  //
  // final updateDateFormat = DateFormat.yMMMMd().format(note['update_date']  ?? DateTime.now());
  // final updateTimeFormat = DateFormat.jm().format(note['update_date'] ?? DateTime.now());


    return 
      InkWell(
        onTap: (){
          Get.to(NoteScreen(),
          arguments: {
            'isUpdate' : true,
            'note' : note,
            'index' : index,
          });

        },
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color:Colors.black.withOpacity(.1)
            ),
          ),
          child: ListTile(
            horizontalTitleGap: 0,
          leading: Container(
            // color: Colors.white,
            height: 10,
            width: 10 ,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Custom_color.backgroundColor
            ),

          ),

            title:
            Text(note['title'],
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note['description'],

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),),


               // note['update_date'] != null ?
                // Text('Update:   $updateTimeFormat - $updateDateFormat') : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    // Text('$createdTimeFormat - $createdDateFormat'),
                    Icon(Icons.edit_note_rounded,color: Custom_color.primaryColor,),
                    InkWell(
                      onTap: (){
                        controller.deleteNote(note.id);
                        Get.snackbar("Deleted", '${note['title']} has been deleted!');
                      },
                        child: Icon(Icons.delete,color: Colors.red,)),
                  ],
                ),
              ],
            ),



          ),
        ),
            ),
      );
  }
}
