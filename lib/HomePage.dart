import 'package:flutter/material.dart';
import 'Screens/AddNote.dart';
import 'Screens/AllNotes.dart';
import 'Screens/Trash.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _selectedIndex = 1;
List<Widget> _options = <Widget>[
  AddNote(),
  AllNotes(),
  Trash()
];

void _onItemTap(int index){
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Note App"),
      ),

      body: _options.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Note",
            backgroundColor: Colors.white
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "All Notes",
            backgroundColor: Colors.white
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "Trash",
            backgroundColor: Colors.white
          ),

        ],

        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        iconSize: 40,
        onTap: _onItemTap,
        elevation: 5,

      ),

    );
  }
}