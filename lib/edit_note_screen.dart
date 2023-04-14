import 'package:flutter/material.dart';
import 'package:not_defteri/models/note.dart';

class EditNoteScreen extends StatefulWidget {
  final Note? note;

  EditNoteScreen({this.note});

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();

    _title = widget.note?.title ?? '';
    _content = widget.note?.content ?? '';
  }


  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final note = Note(
        id: widget.note?.id ?? DateTime.now().millisecondsSinceEpoch,
        title: _title,
        content: _content,
        date: DateTime.now(),
      );

      Navigator.pop(context, note);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Not Ekle' : 'Not Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                initialValue: _title,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Başlık',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen bir başlık girin';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _content,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Notunuz',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _content = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text(widget.note == null ? 'Not Ekle' : 'Not Güncelle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


