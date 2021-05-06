import 'package:flutter/material.dart';
import 'package:task1/HomePage.dart';
import 'package:task1/Models/NoteModel.dart';
import 'package:task1/Services/SharedPreferenceHelper.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Container(
             margin: EdgeInsets.all(10),
             child: TextField(
               controller: title,
               decoration: InputDecoration(
                 labelText: "Title",
                 border: OutlineInputBorder(),
               ),
             ),
           ),


           Container(
             margin: EdgeInsets.all(10),
             child: TextField(
               controller: description,
               decoration: InputDecoration(
                 labelText: "Description",
                 border: OutlineInputBorder(),
               ),
             ),
           ),


           ElevatedButton(
            child: Text("Add Note"),
            onPressed: (){
              NoteModel noteModel = NoteModel(
                title: title.text,
                description: description.text
              );
              note.add(noteModel);
              noteMap.add(noteModel.toMap());
              sharedPreferenceHelper.setNoteData(note);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            )


         ],
       )
    );
  }
}