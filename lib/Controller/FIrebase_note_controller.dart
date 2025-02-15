import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/notes_nodel.dart';

class FirebaseNoteController extends GetxController{

  RxList <NotesModel> notes = <NotesModel>[].obs;
  final fireStore = FirebaseFirestore.instance;

  addNotes(NotesModel notesData){
    fireStore.collection("notes").add({
      'title' : notesData.title,
      'description' : notesData.description,
     // 'create_date' : notesData.createDate,
     // 'update_date' : notesData.updateDate,
    }).then((value) => print("Data added")).onError((error, stackTrace) {
      print("Error $error");
    });

    // notes.add(noteData);
    // update();


  }

  deleteNote(String docID){
    fireStore.collection('notes').doc(docID).delete();
    // notes.removeAt(index);
    // update();

  }

  updateNotes( String docID, NotesModel noteData) {
    fireStore.collection('notes').doc(docID).update({
      'title': noteData.title,
      'description' : noteData.description
    });
  } 
}