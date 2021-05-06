import 'package:flutter/material.dart';
import 'package:task1/Models/NoteModel.dart';
import 'package:task1/Services/SharedPreferenceHelper.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
@override
   void initState() {
  getTData();
    super.initState();
  }

  getTData() async{
    List<NoteModel> noteModels = await sharedPreferenceHelper.getNoteData();
    List<Map<String, dynamic>> map = List<Map<String, dynamic>>.from(noteModels.map((e) => e.toMap()));
    setState(() {
      trash = noteModels;
      trashMap = map;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: trash.length == 0 
      ?   Container(
          height: 750,
          child: Center(child: Text("No Notes Found"),),
      ) : Container(
                child: ListView(
                  children: trashMap.map((v) {
                    if (v != null) {
                      NoteModel e = NoteModel.fromMap(v);
                      return ListTile(
                        title: Text(e.title),
                        subtitle: Text(e.description),
                        trailing: IconButton(icon: Icon(Icons.restore), 
                        onPressed: (){
                          setState(() {
                            note.add(e);
                            trash.remove(e);
                            trashMap.remove(e);
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