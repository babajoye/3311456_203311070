import 'package:flutter/material.dart';
import 'package:not_defteri/models/note.dart';
import 'package:not_defteri/note_detail_screen.dart';
import 'package:not_defteri/edit_note_screen.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Defteri',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> _notes = [
    Note(
      id: 1,
      title: 'Alışveriş Listesi',
      content: 'Ekmek, süt, yumurta, peynir, meyve',
      date: DateTime.now(),),
    Note(
      id: 2,
      title: 'Flutter Öğreniyorum',
      content: 'Stateful widget, StatelessWidget, MaterialApp, Scaffold',
      date: DateTime.now(),),
    Note(
      id: 3,
      title: 'Yemek Tarifi',
      content: 'Tavuk sote, pilav, salata',
      date: DateTime.now(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Defteri'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.date.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _notes.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => EditNoteScreen(note: null)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
