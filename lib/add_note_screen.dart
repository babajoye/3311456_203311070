import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isNotEmpty && _textController.text.isNotEmpty) {
      Navigator.of(context).pop('${_titleController.text}\n${_textController.text}');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Başlık ve metin boş olamaz!'),
            actions: <Widget>[
              TextButton(
                child: Text('Tamam'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Not Başlığı',
                border: OutlineInputBorder(),
              ),
              controller: _titleController,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Not Metni',
                border: OutlineInputBorder(),
              ),
              controller: _textController,
              maxLines: 10,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Not Ekle'),
              onPressed: _saveNote,
            ),
          ],
        ),
      ),
    );
  }
}
