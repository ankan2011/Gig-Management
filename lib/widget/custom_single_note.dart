import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:note_application/Color/custom_color.dart';
import 'package:note_application/Controller/notes_controllers.dart';
import 'package:note_application/View/note_screen.dart';

class CustomSingleNote extends StatelessWidget {

  final int index;

  const CustomSingleNote({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

  final controller = Get.put(NotesController());

  final note = controller.notes.elementAt(index);

  final createdDateFormate = DateFormat.yMMMMd().format(note.createDate);
  final createdTimeFormat = DateFormat.jm().format(note.createDate);

  final updateDateFormat = DateFormat.yMMMMd().format(note.updateDate ?? DateTime.now());
  final updateTimeFormat = DateFormat.jm().format(note.updateDate ?? DateTime.now());


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
            Text(note.title,
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 20,
             ),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.description,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),),
                SizedBox(height: 10,),

                note.updateDate != null ?
                Text('Update:   $updateTimeFormat - $updateDateFormat') : const SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    Text('$createdTimeFormat - $createdDateFormate'),
                    InkWell(
                      onTap: (){
                        controller.deleteNote(index);
                        Get.snackbar("Deleted", '${note.title} has been deleted!');
                      },
                        child: Icon(Icons.delete)),
                  ],
                )
              ],
            ),


          ),
        ),
            ),
      );
  }
}
