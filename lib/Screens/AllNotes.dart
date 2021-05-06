import 'package:flutter/material.dart';
import 'package:task1/Models/NoteModel.dart';
import 'package:task1/Screens/AddNote.dart';
import 'package:task1/Services/SharedPreferenceHelper.dart';

class AllNotes extends StatefulWidget {
  @override
  _AllNotesState createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
@override
   void initState() {
  getData();
    super.initState();
  }

  getData() async{
    List<NoteModel> noteModels = await sharedPreferenceHelper.getNoteData();
    List<Map<String, dynamic>> map = List<Map<String, dynamic>>.from(noteModels.map((e) => e.toMap()));
    setState(() {
      note = noteModels;
      noteMap = map;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNote()));
        },
      ),

      body: note.length == 0 
      ?   Container(
          height: 750,
          child: Center(child: Text("No Notes Found"),),
      ) : Container(
                child: ListView(
                  children: noteMap.map((v) {
                    if (v != null) {
                      NoteModel e = NoteModel.fromMap(v);
                      return ListTile(
                        title: Text(e.title),
                        subtitle: Text(e.description),
                        trailing: IconButton(icon: Icon(Icons.delete), 
                        onPressed: (){
                         // trash.add(e);
                          //noteMap.remove(e);
                         
                          setState(() {
                            trash.add(e);
                             note.remove(e);
                             noteMap.remove(e);

                          });

                        }),
                      );
                    } else
                      return Container();
                  }).toList(),
                ),
              ),
    
    
    );
  }
}